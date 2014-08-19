class RenamePostsIdToPostIdOnComments < ActiveRecord::Migration
  def change
  	rename_column :comments, :posts_id, :post_id
  end
end
