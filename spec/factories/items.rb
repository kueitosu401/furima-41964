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

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec/fixtures/sample.png')), filename: 'sample.png',
                        content_type: 'image/png')
    end
  end
end
