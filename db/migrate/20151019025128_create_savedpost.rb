class CreateSavedpost < ActiveRecord::Migration
  def change
    create_table :savedposts do |t|
      t.integer :user_id
      t.integer :post_id
    end
  end
end
