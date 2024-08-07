class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.string :image_file
      t.datetime :uploaded_at

      t.timestamps
    end
  end
end
