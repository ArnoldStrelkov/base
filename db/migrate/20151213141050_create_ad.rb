class CreateAd < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.string :body
      t.integer :user_id
    end
  end
end
