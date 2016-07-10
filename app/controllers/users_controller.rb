  class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "You're now signed up!"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @skills = @user.skills
    @projects = @user.projects
    @educations = @user.educations
    @experiences = @user.experiences
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update user_params
      redirect_to root_path, notice: "Account updated!"
    else
      flash[:alert] = "Unable to update account."
      render :edit
    end
  end

  def index
    @users = User.order("first_name DESC")
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

end
