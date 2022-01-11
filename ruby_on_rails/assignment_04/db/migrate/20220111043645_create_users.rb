class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :address
      t.boolean :super_user_flag
      t.string :phone
      t.date :birthday

      t.timestamps
    end
  end
end
