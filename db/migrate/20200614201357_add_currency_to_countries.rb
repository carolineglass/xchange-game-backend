class AddCurrencyToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :currency, :string
  end
end
