class LinksController < ApplicationController
  before_action :find_link, only: [:update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_owner, only: [:edit, :update, :destroy]

  def create
    link = Link.new(link_params)
    user = current_user
    link.profile_id  = user.profile.id
    if link.save
      redirect_to edit_user_path(current_user)
    else
      render :root
    end
  end

  def update
    if @link.update(link_params)
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @link.destroy
    redirect_to user_path(current_user)
  end


  private

  def link_params
    params.require(:link).permit(:Github, :Twitter, :LinkedIn)
  end

  def find_link
    @link = Link.find(params[:id])
  end

  def authorize_owner
    redirect_to root_path, alert: "Access Denied" unless can? :manage, @link
  end

end
