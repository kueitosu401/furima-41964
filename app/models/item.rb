class Item < ApplicationRecord
  # has_one :order
  belongs_to :user
  has_one_attached :image
  has_one :order


  def sold_out?
    order.present?
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost, class_name: 'ShippingCosts', foreign_key: 'shipping_costs_id'
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :product_name
    validates :product_description
    validates :price
    validates :image
  end

  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }

  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_costs_id
    validates :shipping_date_id
    validates :prefecture_id
  end
end
