class ApplicationController < ActionController::Base
  before :authenticate_user!

  protected

  def authenticate_user!
    return unless current_user && !current_user.activated?

    sign_out(current_user)
    redirect_to new_user_session_path
  end
end
