class Item < ApplicationRecord
  has_one :order
  belongs_to :user


extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :condition
belongs_to :shipping_cost
belongs_to :prefecture
belongs_to :shipping_date

 with_options presence: true do
  validates :name
  validates :description
  validates :price
  validates :image
 end

    # 価格が整数であること、および半角数字であることを検証します
  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  # 価格が300円以上9,999,999円以下であることを検証します
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  # ActiveHashで定義された各IDについて、0（未選択を示す'---'のID）以外が選択されていることを検証します
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :shipping_date_id
    validates :prefecture_id
  end
end