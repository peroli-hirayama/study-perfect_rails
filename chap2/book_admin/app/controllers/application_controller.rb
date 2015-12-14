class LoginFailed < StandardError
end

class ApplicationController < ActionController::Base
    rescue_from LoginFailed, with: :login_failed
    def login_failed
        render template: 'shared/login_failed', status: 401
    end
#  before_action do
#    redirect_to access_denied_path if params[:token].blank?
#  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
