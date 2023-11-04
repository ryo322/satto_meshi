class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false  #ユーザーID
      t.integer :post_id, null: false  #投稿ID
      t.text :comment, null: false     #コメント
      t.timestamps
    end
  end
end
