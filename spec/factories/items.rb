FactoryBot.define do
  factory :item do
    product_name { '商品名' }
    product_description { '商品の説明' }
    price { 300 }
    category_id { 1 }
    condition_id { 1 }
    shipping_costs_id { 1 }
    prefecture_id { 1 }
    shipping_date_id { 1 }
    association :user

    

    trait :sold_out do
      after(:create) do |item|
        create(:order, item: item, user: create(:user))
      end
    end
  end
end