class ItemsController < ApplicationController


   def index
    @items = Item.all.order(created_at: :desc)
   end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を出品しました。'
    else
      render 'new', status: :unprocessable_entity
    end
  end


end 