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
    @image.uploaded_at = Time.now

    if @image.save
      redirect_to @image, notice: 'Image uploaded successfully.'
    else
      flash[:alert] = @image.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id]).destroy
    redirect_to images_path, notice: 'Image was successfully deleted.'
  end

  private

  def image_params
    params.require(:image).permit(:title, :description, :img_file)
  end
end
