require 'oauth2'

class HomeController < ApplicationController

  before_filter :api_auth

  def index
    @client_response = @api.get('/api/v1/client')
  end

private

  def api_auth
    config = PushModoDrawing::Application.config
    client = OAuth2::Client.new(config.pushmodo[:id], config.pushmodo[:secret], :site => "http://pushmodo.com")
    @api = client.password.get_token(config.pushmodo[:email], config.pushmodo[:password])
    
  end

end
