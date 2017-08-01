class SecondTry < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :integer, :integer
 
  end
end
