class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :posts, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
