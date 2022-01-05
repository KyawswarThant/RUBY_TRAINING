class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :tables do |t|
      t.string :title
      t.text :description
      t.boolean :public_flag
      t.string :user_name

      t.timestamps
    end
  end
end
