class AddAbreviation < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :abreviation, :string

  end
end
