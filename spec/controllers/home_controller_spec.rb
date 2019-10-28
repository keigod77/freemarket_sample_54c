require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #show' do
    it "assigns the requested item to @item" do
      item = create(:item)
      get :show, params: { id: item }
      expect(assigns(:item)).to eq item
    end

    it "renders the :show template" do
      item = create(:item)
      get :show, params: { id: 1 }
      expect(response).to render_template :show
    end
  end

end
