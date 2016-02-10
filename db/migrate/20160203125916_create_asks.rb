class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :target_id, index: true, foreign_key: true
      t.text :body
      t.text :answer

      
    end
  end
end
