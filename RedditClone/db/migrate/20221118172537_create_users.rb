class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true 
      t.string :session_token, null:false, unique: true 
      t.string :password_digest, null: false 

      t.timestamps
    end
  end
end
