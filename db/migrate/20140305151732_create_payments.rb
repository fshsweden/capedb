class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :user
      t.date :date_of_payment
      t.float :amount
      t.string :method
      t.string :desc

      t.timestamps
    end
  end
end
