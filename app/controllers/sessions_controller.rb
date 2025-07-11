class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_user user
      redirect_to user
    else
      flash[:danger] = "Invalid Email/Password combinations"
      render "new"
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out!"
  end
end
