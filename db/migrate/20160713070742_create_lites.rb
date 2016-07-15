class CreateLites < ActiveRecord::Migration
  def change
    create_table :lites do |t|
      t.string :name
      t.string :tel
      t.string :type

      t.timestamps null: false
    end
  end
end
