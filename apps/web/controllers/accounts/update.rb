module Web
  module Controllers
    module Accounts
      class Update
        include Web::Action

        expose :error_messages

        def initialize(users: UserRepository.new, interactor: SyncAccount.new)
          @users      = users
          @interactor = interactor
        end

        def call(params)
          user    = @users.find_with_accounts(params[:user_id])
          account = user.accounts.detect { |account| account.id == params[:id] }

          result = @interactor.call(user, account)

          redirect_to(routes.user_account_path(user.client_id, account.id)) if result.success?

          @error_messages = result.errors
        end
      end
    end
  end
end
