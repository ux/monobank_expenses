require_relative '../../helpers/account'

module Web
  module Views
    module Accounts
      class Show
        include Web::View
        include Web::Helpers::Acccount

        template 'users/show'
      end
    end
  end
end
