class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address,
                :building_name, :telephone_number, :order_id, :token, :user_id, :item_id

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :municipalities
    validates :street_address
    validates :telephone_number
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :post_code, format: {
    with: /\A\d{3}-\d{4}\z/,
    message: 'is invalid. Enter it as follows (e.g. 123-4567)'
  }

  validates :prefecture_id, numericality: {
    other_than: 0,
    message: "can't be blank"
  }

  validates :telephone_number, format: {
    with: /\A\d{10,11}\z/,
    message: 'is invalid. Input only number'
  }, length: {
    minimum: 10,
    too_short: 'is too short'
  }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      municipalities: municipalities,
      street_address: street_address,
      building_name: building_name,
      telephone_number: telephone_number,
      order_id: order.id
    )
  end
end
