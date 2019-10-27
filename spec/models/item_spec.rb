require 'rails_helper'

describe Item do
  describe '#create' do

    #出品可能
    it "can exhibit item" do
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end

    # 出品不可(userなし)
    it "is invalid without a user_id" do
      item = build(:item, user_id: nil)
      item.valid?
      expect(item.errors[:user]).to include("must exist")
    end

    # 出品不可(nameなし)
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    # 出品不可(descriptionなし)
    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    # 出品不可(category_idなし)
    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category]).to include("must exist")
    end

    # 出品不可(stateなし)
    it "is invalid without a state" do
      item = build(:item, state: nil)
      item.valid?
      expect(item.errors[:state]).to include("can't be blank")
    end

    # 出品不可(shipping_chargeなし)
    it "is invalid without a shipping_charge" do
      item = build(:item, shipping_charge: nil)
      item.valid?
      expect(item.errors[:shipping_charge]).to include("can't be blank")
    end

    # 出品不可(delivery_methodなし)
    it "is invalid without a delivery_method" do
      item = build(:item, delivery_method: nil)
      item.valid?
      expect(item.errors[:delivery_method]).to include("can't be blank")
    end

    # 出品不可(regionなし)
    it "is invalid without a region" do
      item = build(:item, region: nil)
      item.valid?
      expect(item.errors[:region]).to include("can't be blank")
    end

    # 出品不可(days_to_deliveryなし)
    it "is invalid without a deys_to_delivery" do
      item = build(:item, days_to_delivery: nil)
      item.valid?
      expect(item.errors[:days_to_delivery]).to include("can't be blank")
    end

    # 出品不可(priceなし)
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
  end
end
