class ShippingCosts < ActiveHash::Base
  self.data = [
    { id: 0, charge: '着払い(購入者負担)' },
    { id: 1, charge: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items
end
