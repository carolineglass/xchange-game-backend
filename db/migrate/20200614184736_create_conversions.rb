class CreateConversions < ActiveRecord::Migration[6.0]
  def change
    create_table :conversions do |t|
      t.integer :country_id
      t.integer :item_id

      t.timestamps
    end
  end
end
