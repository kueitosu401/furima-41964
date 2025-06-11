class Item < ApplicationRecord
  has_one :order
  belongs_to :user


extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :condition
belongs_to :shipping_charge
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
    validates :condition_id        # 商品の状態のID (コントローラーでは item_status_id が使われています)
    validates :shipping_charge_id  # 配送料負担のID (コントローラーでは shipping_fee_status_id が使われています)
    validates :shipping_date_id    # 発送日数のID (コントローラーでは scheduled_delivery_id が使われています)
    validates :prefecture_id
  end
end