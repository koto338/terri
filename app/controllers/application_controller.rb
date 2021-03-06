class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  private
  
  # Basic認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
