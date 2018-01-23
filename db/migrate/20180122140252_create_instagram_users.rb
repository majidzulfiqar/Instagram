class CreateInstagramUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :instagram_users do |t|
      t.string :access_token
      t.string :user_name
      t.string :full_name
      t.string :website
      t.text :bio
      t.timestamps
    end
  end
end
