class AddUsersInvolvedToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :users_involved, :string
  end
end