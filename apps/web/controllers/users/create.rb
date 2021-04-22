module Web
  module Controllers
    module Users
      class Create
        include Web::Action

        expose :error_messages

        params do
          required(:user).schema do
            required(:api_token).filled(:str?)
          end
        end

        def initialize(interactor: SyncUser.new, user_class: User)
          @interactor     = interactor
          @user_class     = user_class
          @error_messages = nil
        end

        def call(params)
          return handle_errors(params.error_messages) unless params.valid?

          result = @interactor.call(@user_class.new(params[:user]))

          return handle_errors(result.errors) if result.failure?

          redirect_to(routes.user_path(result.user.client_id))
        end

        private

        def handle_errors(errors)
          self.status     = 422
          @error_messages = errors
        end
      end
    end
  end
end
