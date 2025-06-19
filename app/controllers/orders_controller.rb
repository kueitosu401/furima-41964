class OrdersController < ApplicationController

  def index

  end  

  def new
  @item = Item.find(params[:item_id])
  @order = Order.new
  end
end  
