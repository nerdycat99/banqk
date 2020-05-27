class Account < ApplicationRecord
  belongs_to :user

  has_many :sent_transactions, :class_name => 'Transaction', :foreign_key => 'payer_id'
  has_many :received_transactions, :class_name => 'Transaction', :foreign_key => 'payee_id'

end
