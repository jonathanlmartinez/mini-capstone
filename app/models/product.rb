class Product < ApplicationRecord
  belongs_to :suplier
  has_many :images
  
  has_many :category_products
  has_many :categories, through: :category_products

  has_many :carted_products 
  has_many :orders, through: :carted_products
  has_many :users, through: :carted_products
 
  validates(:name, {:uniqueness => true, :presence => true})
  validates(:name, {:numericality => { :only_integer => true }})



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
