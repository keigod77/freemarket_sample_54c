require 'rails_helper'

describe Address do
  describe '#create' do

    #登録可
    it "is valid with a user_id, postal_code, prefectures, city, address, building" do
      address = build(:address)
      address.valid?
      expect(address).to be_valid
    end
    #登録不可(user_idない)
    it "is invalid without a user_id" do
      address = build(:address, user_id: nil)
      address.valid?
      expect(address.errors[:user_id]).to include "can't be blank"
    end
    #登録不可(postal_codeない)
    it "is invalid without a postal_code" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include "can't be blank"
    end
    #登録不可(prefecturesない)
    it "is invalid without a prefectures" do
      address = build(:address, prefectures: nil)
      address.valid?
      expect(address.errors[:prefectures]).to include "can't be blank"
    end
    #登録不可(cityない)
    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include "can't be blank"
    end
    #登録不可(addressない)
    it "is invalid without a address" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include "can't be blank"
    end

  end
end
