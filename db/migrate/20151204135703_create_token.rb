class CreateToken < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :token
      t.string :email_tmp
      t.string :user_id
    end
  end
end
