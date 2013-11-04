class AddManyColumnsToTrial < ActiveRecord::Migration
  def change
    add_column :trials, :nct_id, :text
    add_column :trials, :official_title, :text
    add_column :trials, :agency_class, :text
    add_column :trials, :detailed_description, :text
    add_column :trials, :overall_status, :text
    add_column :trials, :phase, :text
    add_column :trials, :study_type, :text
    add_column :trials, :condition, :text
    add_column :trials, :inclusion, :text
    add_column :trials, :exclusion, :text
    add_column :trials, :gender, :text
    add_column :trials, :minimum_age, :integer, :null => false, :default => 0
    add_column :trials, :maximum_age, :integer, :null => false, :default => 120
    add_column :trials, :healthy_volunteers, :text
    add_column :trials, :overall_contact_name, :text
  end
end
