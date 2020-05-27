class Transaction < ApplicationRecord
  belongs_to :payer, :class_name => 'Account'
  belongs_to :payee, :class_name => 'Account'
end

