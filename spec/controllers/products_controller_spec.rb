require 'rails_helper'

describe ProductsController, type: :controller do


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
