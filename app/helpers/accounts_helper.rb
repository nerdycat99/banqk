module AccountsHelper
  def account_number_for(user,account)
    return "BNK-#{sprintf '%04d', user}-#{sprintf '%04d',account}"
  end
end
