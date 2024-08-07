class Image < ApplicationRecord
  mount_uploader :img_file, ImgFileUploader

  validates :title, :description, :img_file, :uploaded_at, presence: true

  def time_since_upload
    elapsed_time = Time.now - self.uploaded_at

    case elapsed_time
    when 0..59
      "#{elapsed_time.to_i} seconds ago"
    when 60..3599
      "#{(elapsed_time / 60).to_i} minutes ago"
    when 3600..7199
      "1 hour ago"
    when 7200..86399
      "#{(elapsed_time / 3600).to_i} hours ago"
    when 86400..172799
      "1 day ago"
    when 172800..31535999
      "#{(elapsed_time / 86400).to_i} days ago"
    when 31536000..63071999
      "1 year ago"
    else
      "#{(elapsed_time / 31536000).to_i} years ago"
    end
  end
end
