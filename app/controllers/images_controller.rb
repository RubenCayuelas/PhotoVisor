class ImagesController < ApplicationController
  def index
    @images = Image.all.order(uploaded_at: :desc)
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.uploaded_att = Time.now

    if @image.save
      redirect_to @image, notice: 'Image uploaded successfully.'
    else
      render :new
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :description, :image_file)
  end
end
