class AddConfirmedToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :confirmed, :boolean, default: false
  end
end
