module AccountsHelper

  def account_number_for(user,account)
    return "BNK-#{sprintf '%04d', user}-#{sprintf '%04d',account}"
  end

  def require_correct_user_logged_in
    return show_error(:forbidden) if !@account || @account.user != current_user
  end

  def show_error(status=:not_found)
    render plain: "something went wrong - #{status.to_s.titleize}", status: status
  end


  def transaction_valid_for(account, amount)
    balance = get_balance_for(account)
    if (balance - amount) < 0 || amount <= 0 || current_user.id != account.user.id
      return false
    else
      return true
    end
  end


  def get_balance_for(account)
    balance = account.balance   
    account.received_transactions.each do | receipt |
      balance += receipt.amount
    end

    account.sent_transactions.each do | payment |
      balance -= payment.amount
    end
    return balance
  end

end
