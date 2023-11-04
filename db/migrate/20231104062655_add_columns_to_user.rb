class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :introduction, :text
    add_column :users, :is_deleted, :boolean, default: false, null: false
  end
end
