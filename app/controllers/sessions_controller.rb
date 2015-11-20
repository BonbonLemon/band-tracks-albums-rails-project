class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    # debugger
    if user.nil?
      flash.now[:errors] = ["Didn't find credentials"]
      render :new
    else
      login_user!(user)
      redirect_to user_url(user)
    end
  end

  def new
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end
end