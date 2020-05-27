require 'rails_helper'

RSpec.describe AccountsController, type: :controller do

  describe "accounts#show action" do

    it "should show the account for a logged in user" do 
      user = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user)
      sign_in account.user
      get :show, params: {id: account.id}
      expect(response).to have_http_status(:success)
    end

    it "should block a non-authenticated user from seeing an account" do
      account = FactoryBot.create(:account)
      get :show, params: {id: account.id}
      expect(response).to redirect_to new_user_session_path
    end

    it "should prevent a logged in user from accessing another users account" do
      user1 = FactoryBot.create(:user)
      sign_in user1
      user2 = FactoryBot.create(:user)
      account = FactoryBot.create(:account, user: user2)
      get :show, params: {id: account.id}
      expect(response).to have_http_status(:forbidden)
    end

    it "should show a 404 if a user attempts to view an account that does not exist" do
      user = FactoryBot.create(:user)
      sign_in user
      get :show, params: {id: 'NONEXIST'}
      expect(response).to have_http_status(:not_found)
    end

  end

end
