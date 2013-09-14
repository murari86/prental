class DeleteUserIdFromUserApplications < ActiveRecord::Migration
  def change
    remove_column :user_applications, :user_id, :integer
  end
end
