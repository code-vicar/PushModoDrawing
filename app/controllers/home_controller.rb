require 'oauth2'

class HomeController < ApplicationController

  before_filter :api_auth

  def index
    
  end

private

  def api_auth
    client = OAuth2::Client.new(config.pushmodo[:app_id], config.pushmodo[:secret], :site => "http://localhost:3000")
    access_token = client.password.get_token(config.pushmodo[:email], config.pushmodo[:password])

    response = access_token.get('/api/v1/client')
    debugger
    puts response
  end

end
