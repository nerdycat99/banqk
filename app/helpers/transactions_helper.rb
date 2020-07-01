module TransactionsHelper

  def all_other_users
    values_for_dropdown = []
    all_users = Account.where.not(:user_id => current_user.id).includes(:user).load
    all_users.each do |account|
      values_for_dropdown << [account.user.username, account.id]
    end
    return values_for_dropdown
  end
  
end
