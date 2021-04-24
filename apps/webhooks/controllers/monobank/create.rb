module Webhooks
  module Controllers
    module Monobank
      class Create
        include Webhooks::Action

        accept :json

        def call(params)
          Hanami.logger.debug(params.raw)
        end
      end
    end
  end
end
