module Web
  module Controllers
    module Users
      class Edit
        include Web::Action

        expose :user

        def initialize(repository: UserRepository.new)
          @repository = repository
        end

        def call(params)
          @user = @repository.find(params[:id])
        end
      end
    end
  end
end
