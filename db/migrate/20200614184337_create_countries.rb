class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :flag
      t.string :code
      t.integer :rate

      t.timestamps
    end
  end
end
