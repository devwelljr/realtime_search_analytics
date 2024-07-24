require 'rails_helper'

RSpec.describe SavedsearchesController, type: :controller do
  let(:ip_address) { '123.45.67.89' }
  let(:saved_search) { create(:saved_search, ip_address: ip_address, search_id: 1, search_count: 2) }

  before do
    request.remote_ip = ip_address
  end

  describe "GET #index" do
    it "assigns @saved_searches_by_ip" do
      get :index
      expected_searches = SavedSearch.where(ip_address: ip_address)

      expect(assigns(:saved_searches_by_ip)).to eq(expected_searches)
    end

    it "assigns @saved_searches" do
      get :index
      expect(assigns(:saved_searches)).to eq(SavedSearch.to_consumable_json)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new SavedSearch" do
        expect {
          post :create, params: { query: 'example search' }
        }.to change(SavedSearch, :count).by(1)
      end

      it "redirects to the saved searches index" do
        post :create, params: { query: 'example search' }
        expect(response).to redirect_to(savedsearches_path)
      end

      it "sets a flash notice" do
        post :create, params: { query: 'example search' }
        expect(flash[:notice]).to eq('Search saved successfully!')
      end
    end

    context "with invalid params" do
      before do
        allow_any_instance_of(SavedSearchService::DB).to receive(:create).and_raise(StandardError)
      end

      it "does not create a new SavedSearch" do
        expect {
          post :create, params: { query: 'example search' }
        }.not_to change(SavedSearch, :count)
      end

      it "redirects to the saved searches index" do
        post :create, params: { query: 'example search' }
        expect(response).to redirect_to(savedsearches_path)
      end

      it "sets a flash alert" do
        post :create, params: { query: 'example search' }
        expect(flash[:alert]).to eq('Search was not saved!')
      end
    end
  end
end
