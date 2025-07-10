class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # some templete
    else
      flash[:danger] = "Invalid Email/Password combinations"
      render "new"
    end
  end

  def destroy
  end
end
