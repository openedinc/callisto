class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :exception, unless: :api_request?
  before_action :authenticate_user!, if: :needs_authentication?

  private
    def needs_authentication?
      params[:controller] != 'devise_token_auth/sessions'
    end

    def api_request?
      request.format.json? || request.format.xml?
    end


end
