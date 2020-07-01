class TransactionsController < ApplicationController
  
  include AccountsHelper

  before_action :authenticate_user!
  before_action :get_users_account, only: [:new, :create]
  before_action :require_correct_user_logged_in, only: [:new, :create]

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to account_path(@account), :notice => "Payment was successful."
    else
      render 'new'
    end
  end



  private

  # def require_correct_user_logged_in 
  #   if !@account || @account.user != current_user
  #     redirect_to root_path, :notice => "Access Forbiden."
  #   end
  # end

  def get_users_account
    @account = Account.find_by_id(params[:account_id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :payee_id, :payer_id)
  end


end
