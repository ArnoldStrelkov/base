class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :body
      t.integer :user_id
       t.timestamps
       
      
    end
  end
end
