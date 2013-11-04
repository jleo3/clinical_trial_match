class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.text :title
      t.text :description
      t.text :sponsor
      t.text :country
      t.text :focus

      t.timestamps
    end
  end
end
