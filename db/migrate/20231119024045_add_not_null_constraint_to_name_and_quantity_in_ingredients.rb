class AddNotNullConstraintToNameAndQuantityInIngredients < ActiveRecord::Migration[6.1]
  def change
    change_column :ingredients, :name, :string, null: false
    change_column :ingredients, :quantity, :string, null: false
  end
end
