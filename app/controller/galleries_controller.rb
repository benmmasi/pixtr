class GalleriesController < ApplicationController
  def index
    render :index
  end

  def new
    @gallery = Gallery.new
    render :new
  end

  def create
    puts params.inspect
  end
end

