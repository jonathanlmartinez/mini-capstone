class SuppliersController < ApplicationController
  has_many :product 
  def new 

    render "new.html.erb"
  end 

  def create
    supplier = Suplier.new(
      name: params[:form_name],
      email: params[:form_email],
      phone_number: params[:form_phone_number],
      )
    supplier.save
    flash[:success] = "Supplier succesfully created"
    redirect_to "/products#index"
  end

  def edit
    suplier_id = params[:id]
    @suplier = Suplier.find_by(id: suplier_id)
    render "edit.html.erb"
  end

  def update
    suplier_id = params[:id]
    @suplier = Product.find_by(id: product_id)
    @suplier.name = params[:form_name]
    @suplier.email = params[:form_email]
    @suplier.phone_number = params[:phone_number]
    @product.save
    flash[:success] = "Supplier succesfully updated"
    redirect_to "/products#index"
  end


  
end
