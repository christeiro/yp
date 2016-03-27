class UsersController < ApplicationController
  before_action :set_params, only: [:create]
  before_action :require_user, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      redirect_to sign_in_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def set_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end