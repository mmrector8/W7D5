class CreatePostSub < ActiveRecord::Migration[7.0]
  def change
    create_table :post_subs do |t|
      t.references :post, null: false, foreign_key: true
      t.references :sub, null: false, foreign_key: true
    
      t.timestamps
    end
    remove_column :posts, :sub_id
  end
end
