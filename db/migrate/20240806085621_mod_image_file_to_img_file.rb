class ModImageFileToImgFile < ActiveRecord::Migration[7.1]
  def change
    rename_column :images, :image_file, :img_file
  end
end
