class RemovingProductIdAndQuantity < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :product_id , :integer
    rename_column :orders, :quantity, :integer

  end
end
