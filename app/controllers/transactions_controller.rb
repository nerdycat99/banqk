class TransactionsController < ApplicationController
  
  include AccountsHelper

  before_action :authenticate_user!

  def new
    @account = Account.find_by_id(params[:account_id])
    if @account.user != current_user
      redirect_to root_path, :notice => "Access Forbiden."
    else
      @all_accounts = Account.all.includes(:user).load
    end
  end

  def create
    @account = Account.find_by_id(params[:account_id])
    if get_balance_for(@account) - params[:transaction][:amount].to_i >= 0
      if params[:transaction][:amount].to_i <= 0
        redirect_to new_account_transaction_path(@account), :notice => "Amount to transfer must be more than zero."
      else
        @transaction = Transaction.create(transaction_params)
        if @transaction.valid?
          redirect_to account_path(@account), :notice => "Payment was successful."
        else
          render :new, status: :unprocessable_entity
        end
      end
    else
      redirect_to new_account_transaction_path(@account), :notice => "Insufficient Funds, please try again"
    end

  end



  private

  def transaction_params
    params.require(:transaction).permit(:amount, :payee_id, :payer_id)
  end


end
