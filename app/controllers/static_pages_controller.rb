class StaticPagesController < ApplicationController
  include AccountsHelper

  def index
    if user_signed_in? 
      @accounts = Account.where(:user_id => current_user.id).load
    end
  end
end
