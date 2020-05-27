class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.references :payee
      t.references :payer
      t.timestamps
    end
    add_foreign_key :transactions, :accounts, column: :payee_id, primary_key: :id
    add_foreign_key :transactions, :accounts, column: :payer_id, primary_key: :id
  end
end
