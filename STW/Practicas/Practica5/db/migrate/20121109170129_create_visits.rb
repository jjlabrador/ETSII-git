class CreateVisits < ActiveRecord::Migration
   def up
      create_table :visits do |t|
         t.string :ip
         t.string :country
         t.string :countryAbrev
      end
      add_index :visits, :ip
   end
   
   def down
      drop_table :visits
   end
end