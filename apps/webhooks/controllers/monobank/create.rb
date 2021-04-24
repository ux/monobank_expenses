module Webhooks
  module Controllers
    module Monobank
      class Create
        include Webhooks::Action

        using CoreExt::Hash
        using CoreExt::String

        accept :json

        def initialize(accounts:        AccountRepository.new,
                       statement_items: StatementItemRepository.new)
          @accounts        = accounts
          @statement_items = statement_items
        end

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

        def call(params)
          return status 200, 'Unsupported type' if params[:type] != 'StatementItem'

          data = params.to_h.deep_transform_keys { |key| key.to_s.underscore.to_sym }[:data]

          statement_item = @statement_items.class.entity.new(data[:statement_item])

          account = @accounts.update(data[:account], balance: statement_item.balance)
          @statement_items.sync(account, statement_item)

          status 200, 'OK'
        end
      end
    end
  end
end
