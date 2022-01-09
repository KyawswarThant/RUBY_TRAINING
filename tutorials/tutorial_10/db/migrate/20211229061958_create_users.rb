class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :super_user_flag
      t.string :phone
      t.text :address
      t.date :birthday

      t.timestamps
    end
  end
end
