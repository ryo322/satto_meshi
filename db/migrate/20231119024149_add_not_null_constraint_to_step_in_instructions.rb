class AddNotNullConstraintToStepInInstructions < ActiveRecord::Migration[6.1]
  def change
    change_column :instructions, :step, :text, null: false
  end
end
