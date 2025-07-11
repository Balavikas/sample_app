class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      reset_session
      log_user user
      redirect_to user
    else
      flash.now[:danger] = "Invalid Email/Password combinations"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged out!"
  end
end
