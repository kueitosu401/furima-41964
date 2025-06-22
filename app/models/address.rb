class Address < ApplicationRecord
validates :post_code,         presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は「123-4567」の形式で入力してください" }
  validates :prefecture_id,     numericality: { other_than: 0, message: "を選択してください" }
  validates :municipalities,    presence: true
  validates :street_address,    presence: true
  validates :telephone_number,  presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁または11桁の数字で入力してください" }

  
  belongs_to :order

 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end