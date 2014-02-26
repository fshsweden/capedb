class CreateCountries < ActiveRecord::Migration
  def change
    
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.timestamps
    end

    puts "Adding some default countries..."
    Country.create(:name => "Sverige", :code => "SE")
    Country.create(:name => "USA", :code => "US")
    Country.create(:name => "Finland", :code => "FI")
    Country.create(:name => "Norge", :code => "NO")
    Country.create(:name => "United Kingdom", :code => "UK")
    Country.create(:name => "France", :code => "FR")


  end
end
