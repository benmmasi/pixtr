class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    render :index
  end

  def new
    @gallery = Gallery.new
    render :new
  end

  def create 
    @gallery = Gallery.new(gallery_params)

    if @gallery.save
      redirect_to gallery_path(@gallery)
    else
      #redirect_to new_gallery_path
      render :new
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])

    if @gallery.update(gallery_params)
      redirect_to gallery_path(@gallery)
    else
      render :edit
    end
  end


  def destroy 
    gallery = Gallery.find(params[:id])
    gallery.destroy

    redirect_to "/"
  end

  def gallery_params
    params.require(:gallery).permit(:name, :description)
  end
end

