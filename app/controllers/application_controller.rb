class ApplicationController < ActionController::Base
  ## this will resolve the session for authenticity token in reactjs
  protect_from_forgery with: :null_session,
    only: Proc.new { |c| c.request.format.json? }
  private

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  ## if require is not sign in
  def require_signin
    unless current_user
      flash[:alert] = "Please sign in first!"
      redirect_to signin_path
    end
  end
  helper_method :current_user
end
