require 'rails_helper'

RSpec.describe Api::V1::PagesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should returns the pages data" do
      create(:page)
      get :index
      json = JSON.parse(response.body)
      expect(json.first["title"]).to eq("Wikipedia apple")
    end
  end

  describe "POST #create" do
    let(:valid_page) {
      {
        title: "Wikipedia apple",
        url: "https://es.wikipedia.org/wiki/Apple"
      }
    }

    let(:invalid_page) {
      {
        url: "https://es.wikipedia.org/wiki/Apple"
      }
    }

    let(:invalid_url) {
      {
        title: "Wikipedia apple",
        url: "invalid_url.com"
      }
    }

    context "with valid params" do
      it "should create a new page" do
        expect {
          post :create, params: { page: valid_page }
        }.to change(Page, :count).by(1)
      end

      it "should returns json page" do
        post :create, params: { page: valid_page }
        json = JSON.parse(response.body)
        expect(json["title"]).to eq("Wikipedia apple")
      end
    end

    context "with invalid params" do
      it "should return bad request when pass invalid url or nil" do
        post :create, params: { page: invalid_url }
        expect(response).to have_http_status(:bad_request)
      end

      it "should return error json when pass invalid url or nil" do
        post :create, params: { page: invalid_url }
        json = JSON.parse(response.body)
        expect(json["error"]).to eq("Invalid url")
      end

      it "should returns error json with invalid params" do
        post :create, params: { page: invalid_page }
        json = JSON.parse(response.body)
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
