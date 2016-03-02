class CreateReq < ActiveRecord::Migration
  def change
    create_table :reqs do |t|
      t.string :text
      t.integer :user_id
    end
  end
end
