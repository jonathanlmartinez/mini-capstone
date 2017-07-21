class Product < ApplicationRecord
  belongs_to :suplier
  has_many :images


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
