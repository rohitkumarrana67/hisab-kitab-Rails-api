class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.float :amount
      t.string :message
      t.timestamps
    end
  end
end
