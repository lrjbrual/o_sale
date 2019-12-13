class UsersController < ApplicationController
  def new
    if current_user
      flash[:notice] = "You have already signed up"
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # who signed in no need to sign in again
      cookies.signed[:user_id] = @user.id
      flash[:notice] = "Signed Up successfully"
      redirect_to root_path
    else
      flash.now[:alert] = "Sign up failed"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
