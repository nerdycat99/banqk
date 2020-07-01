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

    it "should show a 403 forbidden if a user attempts to view an account that does not exist" do
      user = FactoryBot.create(:user)
      sign_in user
      get :show, params: {id: 'NONEXIST'}
      expect(response).to have_http_status(:forbidden)
    end

    it "should show the transactions for a given account" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      account1 = FactoryBot.create(:account, user: user1)
      account2 = FactoryBot.create(:account, user: user2)
      sign_in user1  
      transaction = Transaction.new({:amount => 15, :payee_id => account1.id, :payer_id => account2.id}).save    
      get :show, params: {id: account1.id}
      expect(@controller.instance_variable_get(:@transactions).count).to eq(1)
    end

    it "should not show a transaction where the account was neither the payee or payer" do
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      user3 = FactoryBot.create(:user)
      account1 = FactoryBot.create(:account, user: user1)
      account2 = FactoryBot.create(:account, user: user2)
      account3 = FactoryBot.create(:account, user: user3)
      sign_in user3  
      transaction = Transaction.new({:amount => 15, :payee_id => account1.id, :payer_id => account2.id}).save    
      get :show, params: {id: account3.id}
      expect(@controller.instance_variable_get(:@transactions).count).to eq(0)
    end

  end

end
