class CreateFeed < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :follower_id
      t.integer :followed_id
    end
  end
end
