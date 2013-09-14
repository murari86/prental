class ChangeUserApplicationsName < ActiveRecord::Migration
  def change
   rename_table :user_applications, :applications
  end
end
