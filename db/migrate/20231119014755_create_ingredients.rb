class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :quantity
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
