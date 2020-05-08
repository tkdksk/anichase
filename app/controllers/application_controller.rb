class ApplicationController < ActionController::Base

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end
  class LoginRequired < StandardError; end
  include ErrorHandlers if Rails.env.production?
  
  private def current_member
    if session[:member_id]
      @current_member ||= Member.find_by(id: session[:member_id])
    end
  end

  helper_method :current_member

  private def login_required
    raise LoginRequired unless current_member
  end
end