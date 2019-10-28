require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe '#create' do

    let!(:user) { create(:user, id: 1)}
    let!(:sns) { build(:sns_credential)}

    context '登録可' do

      it "is valid with provider, uid, user_id" do
        expect(sns).to be_valid
      end

    end

    context '登録不可' do

      it "uidが無い" do
        sns[:uid] = nil
        sns.valid?
        expect(sns.errors[:uid]).to include("can't be blank")
      end

      it "providerが無い" do
        sns[:provider] = nil
        sns.valid?
        expect(sns.errors[:provider]).to include("can't be blank")
      end

    end
  end
end
