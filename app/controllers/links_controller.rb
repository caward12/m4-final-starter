class LinksController < ApplicationController

  # def new
  #   @link = Link.new
  # end

  def index
    @link = Link.new
    @links = current_user.links.reverse
    @hot_reads = HotReadsService.hot_links
  end

  def create
    hot_reads = HotReadsService.hot_links
    @user = current_user
    link = @user.links.new(link_params)
    if link.save
      flash.now[:success] = "Successfully added a new link"
      render partial: "link", locals: {link: link, hot_reads: hot_reads}, layout: false
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
