require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do

  describe "transactions#create action" do

    before :each do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @account1 = FactoryBot.create(:account, user: @user1)
      @account2 = FactoryBot.create(:account, user: @user2)
      @transaction = Transaction.new({:amount => 15, :payee_id => @account1.id, :payer_id => @account2.id}).save    
    end

    it "should prevent a user making a transaction unless logged in" do 
      post :create, params: { account_id: @account1.id, transaction: { amount: '20' } }
      expect(response).to redirect_to new_user_session_path
    end

    # it "should prevent a payment if the payer has insufficient funds" do
    #   sign_in @user1  
    #   post :create, params: { account_id: @account1.id, transaction: { amount: '20000' } }
    #   expect(response).to redirect_to new_account_transaction_path(@account1)
    # end

    # it "should prevent a payment for a negative amount" do
    #   sign_in @user1  
    #   post :create, params: { account_id: @account1.id, transaction: { amount: '-20000' } }
    #   expect(response).to redirect_to new_account_transaction_path(@account1)
    # end


  end





end
