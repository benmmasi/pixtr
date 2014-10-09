class ImagesController < ApplicationController
  def show 
    @gallery = load_gallery_from_url
    @image = @gallery.images.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments.recent 
    @image_like_count = @image.likes.count
    @image_likes = @image.likes
    @available_tags = Tag.all
    @number_of_tags = Tag.count
  end

  def new
    @gallery = load_gallery_from_url
    @image = @gallery.images.new
  end

  def create
    @gallery = load_gallery_from_url
    @image = @gallery.images.new(image_params)

    if @image.save
      redirect_to gallery_path(@gallery)
    else
      render :new 
    end
  end

  def edit
    @gallery = load_gallery_from_url
    @image = @gallery.images.find(params[:id])
  end

  def update
    @gallery = load_gallery_from_url
    @image = @gallery.images.find(params[:id])
    
    if @image.update(image_params)
    redirect_to gallery_image_path(@gallery, @image)
    else
      render :edit
    end
  end

  private
  
  def image_params
    params.require(:image).permit(:name, :url, :tag_words, tag_ids: [], group_ids: [])
  end

  def load_gallery_from_url
    Gallery.find(params[:gallery_id])
  end
end
