class Product < ApplicationRecord
  belongs_to :suplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products



  def discounted?
    price <= 100
  end 

  def tax 
    price * 0.09
  end 

  def total 
    price + tax
  end 
  
end
