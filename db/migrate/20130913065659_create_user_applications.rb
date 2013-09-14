class CreateUserApplications < ActiveRecord::Migration
  def change
    create_table :user_applications do |t|
    t.integer :property_id
    t.string :applicant_id
    t.string :applicant_date
    t.string :status
    t.references :property
    t.references :user
    t.timestamps
   end
  end
end

