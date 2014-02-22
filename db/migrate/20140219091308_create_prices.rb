class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :product_id
      t.float :price
      t.datetime :pdatetime

      t.timestamps
    end
  end
end
