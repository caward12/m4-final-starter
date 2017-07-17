class LinksController < ApplicationController

  # def new
  #   @link = Link.new
  # end

  def index
    @link = Link.new
    @links = current_user.links.reverse
  end

  def create
    @user = current_user
    link = @user.links.new(link_params)
    if link.save
      flash.now[:success] = "Successfully added a new link"
      render partial: "links/link", locals: {link: link}, layout: false
    else
      flash.now[:notice] = link.errors.full_messages.first
      redirect_to root_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Successfully updated link"
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
