module Web
  module Helpers
    module Acccount
      def format_currency(amount)
        precision = amount.abs > 10_00 ? 0 : 2
        format_number(amount.to_f / 100, precision: precision)
      end

      def calculate_statements_stats(statement_items)
        statement_items.inject({in: 0, out: 0, delta: 0}) do |memo, statement|
          memo[:in]    += statement.amount if statement.amount > 0
          memo[:out]   += statement.amount if statement.amount < 0
          memo[:delta] += statement.amount

          memo
        end
      end
    end
  end
end
