class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    @order_address = OrderAddress.new
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end

  def create
    @order_address = OrderAddress.new(order_address_params)

    if @order_address.valid?

      Payjp.api_key = ENV['PAYJP_SECRET_KEY']

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
  def set_item
  @item = Item.find(params[:item_id])
  end
  
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
