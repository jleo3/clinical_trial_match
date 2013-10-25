class TrialHasManySites < ActiveRecord::Migration
  def change
  	add_reference :sites, :trial
  end
end
