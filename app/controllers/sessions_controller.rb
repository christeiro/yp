class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:notice] = "You are signed in!"
    else
      flash[:error] = "Invalid e-mail or password"
      redirect_to sign_in_path
    end
  end
end