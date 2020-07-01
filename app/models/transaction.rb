
class Transaction < ApplicationRecord
  belongs_to :payer, :class_name => 'Account'
  belongs_to :payee, :class_name => 'Account'

  validates :amount, :payee_id, :payer_id, presence: true
  validates :amount, credit: true # custom validation on transaction model!! 

end

