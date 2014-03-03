class CreateProducts < ActiveRecord::Migration
  
  def change
    create_table :products do |t|
      t.string :name
      t.string :ptype
      t.belongs_to :country
      t.string :desc
      t.timestamps
    end

    
  end
end
