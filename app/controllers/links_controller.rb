class LinksController < ApplicationController
  before_action :find_link, only: [:update, :destroy]

  def create
    link = Link.new(link_params)
    user = current_user
    link.user = user
    if link.save
      redirect_to user_path(current_user)
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
    params.require(:link).permit(:title, :href)
  end

  def find_link
    @link = Link.find(params[:id])
  end
end
