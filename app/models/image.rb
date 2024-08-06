class Image < ApplicationRecord
  mount_uploader :img_file, ImgFileUploader

  validates :title, :description, :img_file, :uploaded_at, presence: true

  def time_since_upload
    elapsed_time = Time.now - self.uploaded_at

    if elapsed_time < 60
      "#{elapsed_time.to_i} seconds ago"
    elsif elapsed_time < 3600
      "#{(elapsed_time / 60).to_i} minutes ago"
    elsif elapsed_time >= 3600 && elapsed_time < 7200
      "#{(elapsed_time / 3600).to_i} hour ago"
    else
      "#{(elapsed_time / 3600).to_i} hours ago"
    end
  end
end
