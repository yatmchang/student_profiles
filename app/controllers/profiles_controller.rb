class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:contact, :new_contact, :show, :index]

  def new_contact
    @user = User.find params[:user_id]
    @profile = @user.profile
  end

  def contact
    @user = User.find params[:user_id]
    @profile = @user.profile
    # byebug
    @contact_name = params[:contact_name]
    @contact_email = params[:contact_email]
    @contact_message = params[:contact_message]
    @details = {cname: @contact_name, cemail: @contact_email, cmessage: @contact_message}
    Mailer.notify_profile_owner(@details, @profile).deliver_later
    redirect_to user_path(@user), notice: "Message sent"
  end

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
    # params.require(:profile).permit(:avatar, :available, :short_pitch, :long_pitch, :resume)
    params.require(:profile).permit(:avatar, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h, :available, :short_pitch, :long_pitch, :resume)
  end
end
