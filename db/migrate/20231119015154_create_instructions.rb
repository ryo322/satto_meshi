class CreateInstructions < ActiveRecord::Migration[6.1]
  def change
    create_table :instructions do |t|
      t.text :step
      t.references :post, null: false, foreign_key: true
      t.string :process_image

      t.timestamps
    end
  end
end
