class ChangeColumnApplicantId < ActiveRecord::Migration
  def change
    rename_column :applications, :applicant_id, :email
    add_column :applications, :phone_no, :string
  end
end
