class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :title
      t.text :description
      t.text :sponsor
      t.string :country
      t.string :focus

      t.timestamps
    end
  end
end
