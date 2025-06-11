class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :set_dropdown_collections, only: [:new, :create, :edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update]

   def index
    @items = Item.all.order(created_at: :desc)
   end

  def new
    @item = Item.new
  end
  
  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice:
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    redirect_to_show
  end


  def update
    if @item.update(item_params)
      return redirect_to item_path(@item)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

    private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :image,
      :item_name,
      :description,
      :category_id,
      :item_status_id,
      :shipping_fee_status_id,
      :prefecture_id,
      :scheduled_delivery_id,
      :price
    ).merge(user_id: current_user.id)
  end


  def redirect_to_show
    return redirect_to root_path if current_user.id != @item.user.id
  end

  def set_dropdown_collections
    @categories = Categorys.all
    @item_statuses = Item.all
    @shipping_statuses = Shipping_charge.all
    @prefectures = Prefecture.all
    @scheduled_deliveries = ScheduledDelivery.all
  end
   
  def ensure_correct_user
    redirect_to root_path, alert: if @item.user_id != current_user.id
   end
  end
end
