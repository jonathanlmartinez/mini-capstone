class User < ApplicationRecord 
  has_secure_password
  has_many :orders
  has_many :carted_products
  has_many :prdoduct ,through: :carted_products

  validates(:name, {:uniqueness => true, :presence => true})
  validates(:email, {:uniqueness => true, :presence => true})
  validates(:password_digest,{:presence => true})
end

