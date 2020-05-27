module AccountsHelper

  def account_number_for(user,account)
    return "BNK-#{sprintf '%04d', user}-#{sprintf '%04d',account}"
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
