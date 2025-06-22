class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # before_action :redirect_to_show, only: :update
  before_action :set_dropdown_collections, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    return redirect_to root_path if @item.destroy

    render 'show', status: :unprocessable_entity
  end

  private

  def sold_out?
    buyer.present? && stock == 0
  end

  def set_item
    @item = Item.find(params[:id])
  end

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

  # def redirect_to_show
  # redirect_to root_path if current_user.id != @item.user.id
  # end

  def set_dropdown_collections
    @categories = Category.all
    @conditions = Condition.all
    @shipping_costs = ShippingCosts.all
    @prefectures = Prefecture.all
    @shipping_dates = ShippingDate.all
  end

  def ensure_correct_user
    return unless @item.user_id != current_user.id

    redirect_to root_path
  end
end
