class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 0, date: '1~2日で発送' },
    { id: 1, date: '2~3日で発送' },
    { id: 2, date: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
