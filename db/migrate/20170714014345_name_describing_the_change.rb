class NameDescribingTheChange < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :price, :decimal ,precision: 5, scale: 2
    change_column :products, :description, :text 
    add_column :products, :quantity, :integer
    add_column :products, :in_stock, :boolean

  end
end
