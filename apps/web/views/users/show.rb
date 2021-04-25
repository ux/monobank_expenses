require_relative '../../helpers/account'

module Web
  module Views
    module Users
      class Show
        include Web::View
        include Web::Helpers::Account
      end
    end
  end
end
