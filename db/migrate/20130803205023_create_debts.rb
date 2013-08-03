class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.decimal :amount
      t.integer :lender_id
      t.integer :borrower_id
      t.timestamps
    end
  end
end
