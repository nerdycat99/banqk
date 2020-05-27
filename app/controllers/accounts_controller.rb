class AccountsController < ApplicationController

  include AccountsHelper

  before_action :authenticate_user!

  def show
    @account = Account.includes(:user).load.find_by_id(params[:id])
    return show_error if @account.blank?
    @transactions = Transaction.where(:payee => @account.id).or(Transaction.where(:payer => @account.id)).includes(payee:[:user],payer:[:user]).load.sort_by &:created_at
    @balance = get_balance_for(@account)
    return show_error(:forbidden) if @account.user != current_user
  end



  private

  def show_error(status=:not_found)
    render plain: "something went wrong - #{status.to_s.titleize}", status: status
  end
end
