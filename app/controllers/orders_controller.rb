class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end  

  def new
  @item = Item.find(params[:item_id])
  @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to some_path, notice: 
    else
      render :new
    end
  end  



 private

  def order_params
   params.require(:order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end
end
