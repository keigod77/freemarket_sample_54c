require 'rails_helper'

describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'assigns the requested ladies_items to @ladies_items' do
      ladies_items = create(:item)
      expect(assigns(:ladies_items)).to eq @ladies_items
    end

    it 'assigns the requested mens_items to @mens_items' do
      mens_items = create(:item)
      expect(assigns(:mens_items)).to eq @mens_items
    end

    it 'assigns the requested toy_items to @toy_items' do
      toy_items = create(:item)
      expect(assigns(:toy_items)).to eq @toy_items
    end

    it 'assigns the requested machine_items to @machine_items' do
      machine_items = create(:item)
      expect(assigns(:machine_items)).to eq @machine_items
    end

    it 'assigns the requested nike_items to @nike_items' do
      nike_items = create(:item)
      expect(assigns(:nike_items)).to eq @nike_items
    end

    it 'assigns the requested supreme_items to @supreme_items' do
      supreme_items = create(:item)
      expect(assigns(:supreme_items)).to eq @supreme_items
    end

    it 'assigns the requested louisvuitton_items to @louisvuitton_items' do
      louisvuitton_items = create(:item)
      expect(assigns(:louisvuitton_items)).to eq @louisvuitton_items
    end

    it 'assigns the requested chanel_items to @chanel_items' do
      chanel_items = create(:item)
      expect(assigns(:chanel_items)).to eq @chanel_items
    end
  end
end
