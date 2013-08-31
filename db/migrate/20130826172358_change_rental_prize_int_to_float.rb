class ChangeRentalPrizeIntToFloat < ActiveRecord::Migration
  def change
    def self.up
     change_column :properties, :rental_prize, :float
    end

    def self.down
     change_column :properties, :rental_prize, :integer
    end
  end
end
