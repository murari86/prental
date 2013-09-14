class AddColumnApplications < ActiveRecord::Migration
  def change
    add_column :applications, :start_date, :date
    add_column :applications, :end_date, :date
    remove_column :applications, :applicant_date, :string
  end
end
