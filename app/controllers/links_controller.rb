class LinksController < ApplicationController

  # def new
  #   @link = Link.new
  # end

  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
  end
end
