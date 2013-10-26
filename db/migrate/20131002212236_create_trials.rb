class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :title
      t.string :description
      t.string :sponsor
      t.string :country
      t.string :focus

      t.timestamps
    end
  end
end
