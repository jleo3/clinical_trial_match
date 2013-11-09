class AddEvenMoreColumnsToTrial < ActiveRecord::Migration
  def change
    add_column :trials, :overall_contact_phone, :text
    add_column :trials, :overall_contact_email, :text
    add_column :trials, :location_countries, :text
    add_column :trials, :link_url, :text
    add_column :trials, :link_description, :text
    add_column :trials, :firstreceived_date, :text
    add_column :trials, :lastchanged_date, :date
    add_column :trials, :verification_date, :date
    add_column :trials, :keyword, :text
    add_column :trials, :is_fda_regulated, :text
    add_column :trials, :has_expanded_access, :text
  end
end
