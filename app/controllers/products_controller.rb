class ProductsController < ApplicationController

  def index
    @products = Product.all
    render "index.html.erb"
  end 

  def show 
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "show.html.erb"
  end 

  def new
    render "new.html.erb"
  end 

  def create
    product = Product.new(
      name: params[:form_name],
      description: params[:form_description],
      price: params[:form_price],
      image: params[:form_image]
      )
    product.save
    render "create.html.erb"
  end

end
