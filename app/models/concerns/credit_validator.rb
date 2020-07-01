class CreditValidator < ActiveModel::EachValidator

  include AccountsHelper

  def validate_each(record, attribute, value)
    if record.amount? && record.payee_id
      account = Account.where(:id => record.payer_id).first
      current_balance = get_balance_for(account)
      if current_balance - record.amount < 0 
        record.errors.add(attribute, "exceeds your current balance")
      end
    end
  end

end