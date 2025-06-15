class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]#update
  before_action :set_item, only: [:show, :edit ] #update
  before_action :set_dropdown_collections, only: [:new, :create, :edit] #update]
  before_action :ensure_correct_user, only: [:edit] #update]

  def index
    @items = Item.all.order(created_at: :desc)
    
  end


  def new
    @item = Item.new
    @categories = Category.all
  end

  #def show
  #end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice:
    else
      render 'new', status: :unprocessable_entity
    end
  end

  #def edit
    #redirect_to_show
  #end

  #def update
    #return redirect_to item_path(@item) if @item.update(item_params)

    #render 'edit', status: :unprocessable_entity
  #end

  private

  #def set_item
    #@item = Item.find(params[:id])
  #end

  def item_params
    params.require(:item).permit(
      :image,
      :product_name,
      :product_description,
      :category_id,
      :condition_id,
      :shipping_costs_id,
      :prefecture_id,
      :shipping_date_id,
      :price
    ).merge(user_id: current_user.id)
  end

  #def redirect_to_show
    #redirect_to root_path if current_user.id != @item.user.id
  #end

  def set_dropdown_collections
    @categories = Category.all
    @conditions = Condition.all
    @shipping_costs = ShippingCosts.all
    @prefectures = Prefecture.all
    @shipping_dates = ShippingDate.all
  end

  #def ensure_correct_user
    #redirect_to root_path, alert: if @item.user_id != current_user.id
                                  #end
  #end
end
