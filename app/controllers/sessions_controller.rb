class SessionsController < ApplicationController
  def new
    #redirect only login
    redirect_to root_path if current_user
  end

  def create
    # 1. Find user by email address and convert to downcase
    user = User.find_by(email: params[:email].downcase)
    # 2. Check if user can be authenticated using the password provided
    if user && user.authenticate(params[:password])
      # 3. If user is found and authenticated, then set signed cookie
      cookies.signed[:user_id] = user.id # cookies can provide to the server once it is signed in
      flash[:notice] = "Sign in successful"
      redirect_to root_path
    else
      # 4. Set an alert message and render new form
      flash.now[:alert] = "Invalid email / password combination"
      render :new
    end
  end

  def destroy
    cookies.delete :user_id
    flash[:notice] = "You have been sign out"
    redirect_to root_path
  end
end
