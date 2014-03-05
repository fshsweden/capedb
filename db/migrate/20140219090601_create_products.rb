class CreateProducts < ActiveRecord::Migration
  
  def change
    create_table :products do |t|
      t.string :symbol
      t.string :name
      t.string :ptype
      t.string :issuer
      t.float :expense_ratio
      t.string :inception  # 1999
      t.string :category

      t.belongs_to :country
      t.string :desc
      t.timestamps
    end

    
  end
end


