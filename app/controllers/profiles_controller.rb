class ProfilesController < ApplicationController

  def new_contact
    @user = User.find params[:user_id]
    @profile = @user.profile
  end

  def contact
    @user = User.find params[:user_id]
    @profile = @user.profile
    @details = params[:profile]
    Mailer.notify_profile_owner(@details, @profile).deliver_now
    redirect_to user_path(@user), notice: "Message sent"
  end

  before_action :authenticate_user!, except: [:show, :index]

  def edit
    @user = User.find params[:user_id]
    @profile = Profile.find params[:id]
  end

  def update
    @user = User.find params[:user_id]
    @profile = Profile.find params[:id]
    if @profile.update profile_params
      redirect_to user_path(@user), notice: "Profile Updated"
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:avatar, :available, :short_pitch, :long_pitch, :resume)
  end
end
