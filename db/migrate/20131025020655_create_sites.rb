class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.text :facility
      t.text :street_address
      t.text :street_address2
      t.text :city
      t.text :state
      t.text :country
      t.text :zip_code

      t.timestamps
    end
  end
end
