class AccountsController < ApplicationController

  include AccountsHelper

  before_action :authenticate_user!
  before_action :get_users_account
  before_action :require_correct_user_logged_in, only: [:show]

  def show
    @transactions = Transaction.where(:payee => @account.id).or(Transaction.where(:payer => @account.id)).includes(payee:[:user],payer:[:user]).load.sort_by &:created_at
    @balance = get_balance_for(@account)
  end



  private

  def get_users_account
    @account = Account.includes(:user).load.find_by_id(params[:id])
  end

end
