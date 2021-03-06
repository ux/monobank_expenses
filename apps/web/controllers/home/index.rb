module Web
  module Controllers
    module Home
      class Index
        include Web::Action

        expose :users

        def initialize(repository: UserRepository.new)
          @repository = repository
        end

        def call(params)
          @users = @repository.all
        end
      end
    end
  end
end
