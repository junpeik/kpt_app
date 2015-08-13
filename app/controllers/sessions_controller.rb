class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      flash[:success] = "successfully logged-in"
      redirect_to user_path(user)
    else
      flash[:error] = "Login has failed"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
