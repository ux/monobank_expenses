require_relative '../../helpers/account'

module Web
  module Views
    module Users
      class Show
        include Web::View
        include Web::Helpers::Acccount
      end
    end
  end
end
