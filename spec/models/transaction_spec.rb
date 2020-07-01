require 'rails_helper'

RSpec.describe Transaction, type: :model do

  describe "validations" do


    it "should allow a valid transaction to be created" do
      # transaction = Transaction.new(:amount => nil, :payer_id => 1, :payee_id => 2)
      # expect(transaction).to be_valid
    end

    


  end


  # it "should not allow the amount to be empty" do
  #   transaction.amount = nil
  #   expect(transaction).to_not be_valid
  # end
  


      # it "should prevent a payment if the payer has insufficient funds" do
      # sign_in @user1  
      # post :create, params: { account_id: @account1.id, transaction: { amount: '20000' } }
      # expect(response).to redirect_to new_account_transaction_path(@account1)
    

end
