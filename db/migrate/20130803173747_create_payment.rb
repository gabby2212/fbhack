class CreatePayment < ActiveRecord::Migration
  def change
  	create_table :payments do |t|
      t.decimal :amount
      t.integer :sender_id
      t.integer :receiver_id
    end
  end
end
