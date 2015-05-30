class AddBankTransactionToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :bank_transaction, :boolean
  end
end
