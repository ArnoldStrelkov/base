class CreateTusa < ActiveRecord::Migration
  def change
    create_table :tusas do |t|
      t.string :name
      t.string :tel
    end
  end
end
