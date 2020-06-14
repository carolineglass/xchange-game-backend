class ChangeDataTypeForRateInCountries < ActiveRecord::Migration[6.0]
  def change
    change_column :countries, :rate, :float
  end
end
