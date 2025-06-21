class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address,
                :building_name, :telephone_number, :order_id, :token, :user_id, :item_id

  
  with_options presence: true do
    validates :post_code,        format: { with: /\A\d{3}-\d{4}\z/, message: "は「123-4567」の形式で入力してください" }
    validates :prefecture_id,   numericality: { other_than: 0, message: "を選択してください" }
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }
    #validates :token
    validates :user_id
    validates :item_id
  end


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