class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references  :user,            null: false
      t.string      :name,            null: false
      t.text        :description,     null: false
      t.references  :category,        null: false
      t.references  :brand,           null: false
      t.references  :size,            foreign_key: true
      t.integer      :state,           null: false
      t.integer      :shipping_charge, null: false
      t.integer      :delivery_method, null: false
      t.string      :region,          null: false
      t.integer      :days_to_delivery,null: false
      t.integer     :price,           null: false
      t.integer     :seller_id,       null: false
      t.integer     :buyer_id,        null: false
      t.timestamps
    end
  end
end
