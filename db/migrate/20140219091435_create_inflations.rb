class CreateInflations < ActiveRecord::Migration
  def change
    create_table :inflations do |t|
      t.belongs_to :country
      t.integer :year
      t.float :inflation

      t.timestamps
    end
  end
end
