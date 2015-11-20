class UsersController < ApplicationController
  def show
  end

  def create

    @user = User.new(user_params)
    # debugger
    if @user.save
      login_user!(@user)
      # redirect_to user_url(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
