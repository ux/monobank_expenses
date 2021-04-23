require './config/environment'
require 'rack/auth/basic'

use Rack::Auth::Basic, 'Restricted Area' do |username, password|
  [username, password].join(':') == ENV['HTTP_CREDENTIALS']
end

run Hanami.app
