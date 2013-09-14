class AddAvatarColumnsToProperties < ActiveRecord::Migration
  def self.up
    add_attachment :properties, :avatar
  end

  def self.down
    remove_attachment :properties , :avatar
  end
end
