class CreateFocus < ActiveRecord::Migration
  def change
    create_table :focus do |t|
      t.string :term

      t.timestamps
    end
  end
end
