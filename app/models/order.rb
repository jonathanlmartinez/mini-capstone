class Order < ApplicationRecord
  
  belongs_to :order, optional: true

  has_many :products
  belongs_to :user
  has_many :carted_products
  has_many :products,through: :carted_products
end
