require 'rails_helper'

describe ProductsController, type: :controller do
  describe 'PATCH #update' do
    let!(:user){ create(:user) }
    before do
      sign_in user
    end
    it '商品情報が更新されるか' do
      item = create(:item,user: user)
      patch :update, params: { id: item, item: attributes_for(:item, name: "hogehoge") }
      item.reload
      expect(item.name).to eq "hogehoge"
    end
  end

  describe 'DELETE #destroy' do
    it '商品を削除できるか' do
      item = create(:item)
      image = create(:image)
      expect(Item.where(id: 1).count).to eq 1
      expect(Image.where(id: 1).count).to eq 1
      expect{ image.destroy }.to change{ Image.count }.by(-1)
      expect{ item.destroy }.to change{ Item.count }.by(-1)
    end
  end
end
