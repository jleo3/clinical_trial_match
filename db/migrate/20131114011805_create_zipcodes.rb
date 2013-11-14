class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.integer :zipcode
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
