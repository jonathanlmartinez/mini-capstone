class CartedProductsController < ApplicationController
  def create
    @user = User.find_by(id: current_user.id)
    @product = Product.find_by(id: params[:id].to_i)
    @cal_subtotal = @product.price * params[:quantity].to_i
    @cal_tax = @product.tax * params[:quantity].to_i
    @cal_total = @cal_tax + @cal_subtotal
    carted = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:id],
      quantity: params[:quantity],
      status: "carted"
    )
    carted.save
    redirect_to "/"
  end

  def index
    # @user = User.find_by(id: current_user.id)
    # @product = Product.find_by(id: params[:id].to_i)
    # @cal_subtotal = @product.price * params[:quantity].to_i
    # @cal_tax = @product.tax * params[:quantity].to_i
    # @cal_total = @cal_tax + @cal_subtotal
    # cart = CartedProduct.where("user_id LIKE ? AND status = ?", 2, "carted")
    @carted_products = current_user.carted_products.where("status LIKE ?", "carted")
    
    @user_id =
    @subtotal =
    @tax =
    @total =
    render "index.html.erb"
  end 
end
