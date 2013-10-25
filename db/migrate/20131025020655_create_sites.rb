class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :facility
      t.string :street_address
      t.string :street_address2
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code

      t.timestamps
    end
  end
end
