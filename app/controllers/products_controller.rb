class ProductsController < ApplicationController

  def index
    @products = Product.all
    render "index.html.erb"
  end 

  def show 
    @product_id = params[:id]
    @product = Product.find_by(id: @product_id)
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
    flash[:success] = "Product succesfully created"
    redirect_to "products#index"

  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render "edit.html.erb"
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:form_name]
    @product.description = params[:form_description]
    @product.image = params[:form_image]
    @product.price = params[:form_price]
    @product.save
    flash[:success] = "Product succesfully updated"
    redirect_to "/products/#{product_id}"
  end

  def destroy 
    id = params[:id]
    contact = Contact.find_by(id: id)
    contact.destroy
    flash[:danger] = "Product succesfully deleted"
    redirect_to "/products"
  end 

end
