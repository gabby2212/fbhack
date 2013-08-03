class CreateDebtsGroups < ActiveRecord::Migration
  def change
    create_table :debts_groups do |t|
      t.references :debt
      t.references :group
    end
  end
end
