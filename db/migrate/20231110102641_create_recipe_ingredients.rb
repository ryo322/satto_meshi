class CreateRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_ingredients do |t|
      t.references :post, null: false, foreign_key: true
      t.string :ing_name
      t.string :quantity

      t.timestamps
    end
  end
end
