class CreateEarnings < ActiveRecord::Migration
  def change
    create_table :earnings do |t|
      t.belongs_to :product
      t.date :date_of_entry
      t.integer :year
      t.float :profit

      t.timestamps
    end
  end
end
