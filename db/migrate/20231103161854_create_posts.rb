class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false    #ユーザーID
      t.integer :tag_id, null: false     #タグID
      t.string :name, null: false        #レシピ名
      t.text :introduction, null: false  #調理方法
      t.string :material, null: false    #材料
      t.timestamps
    end
  end
end
