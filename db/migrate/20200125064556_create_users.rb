class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :user_name
      t.text :profile
      t.string :icon
      t.string :header

      t.timestamps
    end
  end
end
