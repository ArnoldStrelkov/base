class AddColToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :foto, :string
    add_column :posts, :video, :string
  end
end
