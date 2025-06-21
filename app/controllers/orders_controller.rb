class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)

    if @order_address.valid?
      Payjp.api_key = 'sk_live_6613c3163e24797fb04ccdbec2d2ed9c50bb15386352e90af4d20c0b'
      Payjp::Charge.create(
        amount: @item.price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path, notice: 
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(
      :post_code,
      :prefecture_id,
      :municipalities,
      :street_address,
      :building_name,
      :telephone_number,
      :token
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end