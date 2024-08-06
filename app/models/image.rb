class Image < ApplicationRecord
  mount_uploader :img_file, ImgFileUploader

  validates :title, :description, :image_file, :uploaded_at, presence: true
end
