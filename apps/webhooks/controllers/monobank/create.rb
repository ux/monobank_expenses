module Webhooks
  module Controllers
    module Monobank
      class Create
        include Webhooks::Action

        using CoreExt::Hash
        using CoreExt::String

        accept :json

        # {
        #   "type"=>"StatementItem",
        #   "data"=>{
        #     "account"=>"xxxxxx",
        #     "statementItem"=>{
        #       "id"=>"xxxxxxxx",
        #       "time"=>1619266478,
        #       "description"=>"На Білу картку",
        #       "mcc"=>4829,
        #       "originalMcc"=>4829,
        #       "amount"=>-104,
        #       "operationAmount"=>-104,
        #       "currencyCode"=>980,
        #       "commissionRate"=>4,
        #       "cashbackAmount"=>0,
        #       "balance"=>2865221,
        #       "hold"=>true
        #     }
        #   }
        # }

        def initialize(interactor: UpdateStatementItem.new)
          @interactor = interactor
        end

        def call(params)
          data = params.to_h.deep_transform_keys { |key| key.to_s.underscore.to_sym }[:data]

          case params[:type]
          when 'StatementItem'
            @interactor.call(data[:account], data[:statement_item])

            status 200, 'OK'
          else
            status 200, 'OK - Unsupported update'
          end
        end
      end
    end
  end
end
