class AddPriceToGood < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :price, :integer
  end
end
