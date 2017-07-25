class OrdersController < ApplicationController
  def create 
    @user = User.find_by(id: current_user.id)
    @product = Product.find_by(id: params[:id].to_i)
    @cal_subtotal = @product.price * params[:quantity].to_i
    @cal_tax = @product.tax * params[:quantity].to_i
    @cal_total = @cal_tax + @cal_subtotal
    order = Order.new(
      user_id: current_user.id,
      product_id: params[:id],
      quantity: params[:quantity],
      subtotal: @cal_subtotal,
      tax: @cal_tax,
      total: @cal_total
      )
    order.save 
    render "show.html.erb"
  end 



end
