class OrdersController < ApplicationController
  def create 
    order = Order.new(
      user_id: current_user.id,
      subtotal: @cal_subtotal,
      tax: @cal_tax,
      total: @cal_total
      )
    order.save 
    render "show.html.erb"
  end 



end
