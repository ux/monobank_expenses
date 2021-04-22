module Web
  module Controllers
    module Users
      class Show
        include Web::Action

        expose :user

        def initialize(repository: UserRepository.new)
          @repository = repository
        end

        def call(params)
          @user = @repository.find_with_accounts(params[:id])
        end
      end
    end
  end
end
