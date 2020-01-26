class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :user_id
      t.text :content
      t.string :img1
      t.string :img2
      t.string :img3
      t.string :img4

      t.timestamps
    end
  end
end
