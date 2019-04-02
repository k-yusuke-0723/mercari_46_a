require 'rails_helper'

describe ItemsController do
  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params: {  id: 1 }
    end
  end

  describe 'delete #destroy' do
    it "deletes the item" do
      item = FactoryBot.create(:item)
      expect{
        item.destroy
      }.to change(Item,:count).by(-1)
    end
  end

  describe 'GET #index' do
    it "http access success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end
