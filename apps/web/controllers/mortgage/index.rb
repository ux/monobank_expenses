module Web
  module Controllers
    module Mortgage
      class Index
        include Web::Action

        expose :payments_by_year, :mortgage, :start_amount, :percent, :monthly_payment

        params do
          optional(:mortgage).schema do
            required(:start_amount).filled(:int?)
            required(:monthly_payment).filled(:int?)
            required(:percent).filled(:float?)
          end
        end

        def call(params)
          @mortgage = { start_amount: 960, monthly_payment: 30, percent: 11.45 }
            .merge(params[:mortgage] || {})

          @start_amount, @monthly_payment, @percent =
            @mortgage.values_at(:start_amount, :monthly_payment, :percent)

          @payments_by_year = 240.times
            .map { |i| calculate_amount(i, @start_amount, @percent, @monthly_payment).round }
            .take_while { |v| v >= 0 }
            .each_slice(12)
            .to_a
        end

        private

        def calculate_amount(index, start_amount, percent, monthly_payment)
          monthly_percent = 1 + percent.to_f / 12 / 100

          monthly_percent ** index * start_amount - monthly_payment * (1 - monthly_percent ** index) / (1 - monthly_percent)
        end
      end
    end
  end
end
