class AddFieldsToSite < ActiveRecord::Migration
  def change
    add_column :sites, :status, :string
    add_column :sites, :contact_name, :string
    add_column :sites, :contact_phone, :string
    add_column :sites, :contact_phone_ext, :string
    add_column :sites, :contact_phone_email, :string
  end
end
