class AddReportableTypeToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :reportable_type, :string
  end
end
