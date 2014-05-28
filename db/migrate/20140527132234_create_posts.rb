class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :description
      t.string :title
      # attach_file 'Picture', Rails.root.join('/images/cat.jpg')

      t.timestamps
    end
  end
end
