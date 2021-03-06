class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = current_user.links.reverse
  end

  def create
    @user = current_user
    link = @user.links.new(link_params)
    if link.save
      flash.now[:notice] = "Successfully added a new link"
      render partial: "link", locals: {link: link}, layout: false
    else
      flash.now[:notice] = link.errors.full_messages.join(", ")
      render partial: "shared/flash"
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:notice] = "Successfully updated link"
      redirect_to root_path
    else
      flash[:notice] = @link.errors.full_messages.first
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
