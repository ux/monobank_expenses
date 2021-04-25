module Web
  module Controllers
    module Users
      class Update
        include Web::Action

        expose :user, :error_messages

        params do
          required(:user).schema do
            required(:phone_number) { str? }
          end
        end

        def initialize(repository: UserRepository.new)
          @repository = repository
        end

        def call(params)
          return handle_errors(params.error_messages) unless params.valid?

          @user = @repository.update(params[:id], params[:user])

          redirect_to(routes.user_path(@user.client_id))
        end

        private

        def handle_errors(errors)
          self.status     = 422
          @error_messages = errors
          @user           = @repository.find(params[:id]) unless defined?(@user)
        end
      end
    end
  end
end
