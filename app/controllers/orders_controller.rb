class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end  

  def new
  @item = Item.find(params[:item_id])
  @order = Order.new
  end

  def create
     @item = Item.find(params[:item_id])
     @order_address = OrderAddress.new(order_address_params)
     
  if @order_address.valid?
    @order_address.save
    redirect_to root_path
  else
    render :index
  end

       @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = "sk_test_***********"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
      @order.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  


    binding.pry
    @order = Order.new(order_params)
    if @order.save
      redirect_to some_path, notice: 
    else
      render :new
    end
  end  



 private

  def order_params
   params.require(:order_address).permit(
      :postal_code, :prefecture_id, :city, :address, :building, :phone_number
    ).merge(
      token: params[:token],
      price: Item.find(params[:item_id]).price,
      item_id: params[:item_id]
    )
  end
   

    def order_address_params
     params.require(:order_address).permit(
    :post_code, :prefecture_id, :municipalities, :street_address,
    :building_name, :telephone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end
    
    def order_params
    params.require(:order_address).permit(
      :post_code,
      :prefecture_id,
      :municipalities,
      :street_address,
      :building_name,
      :telephone_number,
      :order
    ).merge(oder_id: current_user.id)
    end
   
end
