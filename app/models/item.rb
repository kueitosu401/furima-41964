class Item < ApplicationRecord
  #has_one :order
  belongs_to :users
end
