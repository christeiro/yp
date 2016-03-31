class UsersController < ApplicationController
  before_action :set_params, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(set_params)
    if @user.save
      redirect_to sign_in_path, notice: "Your account was created successfully!"
    else
      flash[:error] = "Please fix the form errors!"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  private
  def set_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end