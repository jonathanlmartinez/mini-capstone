class ProductsController < ApplicationController

  def index
    

    sort_attribute = params[:sort_by]
    sort_order = params[:sort_order]
    search = params[:form_search_input]

    search = params[:search_input]

    if search 
      @products = Product.where("first_name LIKE ?", "%" + search + "%")
    else 
      @products = Product.all
    end
     
    category_name = params[:category]
    if category_name
      category = Category.find_by(name: category_name)
      @products = category.products
    end  

    # if sort_attribute && sort_order
    #   @products = Product.all.order(sort_attribute => sort_order) 
    # else
    #   @products = Product.all
    # end

    render "index.html.erb"

  end 

  def show 
    @product_id = params[:id]
    @product = Product.find_by(id: @product_id)

    category = Category.find_by(product_id: id)
    @categories = category.products
    render "show.html.erb"
  end 

  def new
    render "new.html.erb"
  end 

  def create
    product = Product.new(
      abreviation: params[:form_abreviation],
      name: params[:form_name],
      description: params[:form_description],
      price: params[:form_price],
      )
    product.save

    image = Image.new(
    image_url: params[:form_image],
    product_id: @product_id
    )
    image.save

    flash[:success] = "Your Product was succesfully created"
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
