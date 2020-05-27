require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "static_pages#index action" do

    it "should return accounts for a user if logged in" do
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      sign_in account.user
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should not show any accounts for unauthenticated user" do
      user = FactoryBot.create(:user)
      account1 = FactoryBot.create(:account, user: user)
      account2 = FactoryBot.create(:account, user: user)
      get :index
      expect(response.body).to eq("")
    end

  end

end