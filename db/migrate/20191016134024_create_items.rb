class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references  :user,            null: false
      t.string      :name,            null: false
      t.text        :description,     null: false
      t.references  :category,        null: false
      t.references  :brand,           null: false
      t.references  :size,            foreign_key: true
      t.string      :state,           null: false
      t.string      :shipping_charge, null: false
      t.string      :delivery_method, null: false
      t.string      :region,          null: false
      t.string      :days_to_delivery,null: false
      t.integer     :price,           null: false
      t.integer     :seller_id,       null: false
      t.integer     :buyer_id,        null: false
      t.timestamps
    end
  end
end
