class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|

t.string           :product_name,             null: false
t.text             :product_description,      null: false
t.integer          :category_id,              null: false
t.integer          :shipping_costs_id,        null: false
t.integer          :region_of_origin_id,      null: false
t.integer          :condition_id,             null: false
t.integer          :prefecture_id,            null: false
t.references       :user,                     null: false, foreign_key: true
t.integer          :sales_price,              null: false
t.timestamps

      t.timestamps
    end
  end
end
