class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :property

      t.timestamps
    end
    add_index :comments, :property_id
  end
end
