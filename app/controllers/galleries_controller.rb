class GalleriesController < ApplicationController
  before_action :require_login

  def index
    @galleries = current_user.galleries.all
    render :index
  end

  def new
    @gallery = current_user.galleries.new
    render :new
  end

  def create 
    @gallery = current_user.galleries.new(gallery_params)

    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      render :new
    end
  end

  def show
    @gallery = load_gallery_from_url
  end

  def edit
    @gallery = load_gallery_from_url
  end

  def update
    @gallery = load_gallery_from_url

    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery)
    else
      render :edit
    end
  end


  def destroy 
    gallery = Gallery.find(params[:id])
    gallery.destroy

    redirect_to root_path
  end

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end

  private

  def load_gallery_from_url
    current_user.galleries.find(params[:id])
  end
end

