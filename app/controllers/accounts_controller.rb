class AccountsController < ApplicationController

  include AccountsHelper

  before_action :authenticate_user!

  def show
    @account = Account.find_by_id(params[:id])
    return show_error if @account.blank?
    return show_error(:forbidden) if @account.user != current_user
  end



  private

  def show_error(status=:not_found)
    render plain: "something went wrong - #{status.to_s.titleize}", status: status
  end
end
