class AddUserIdsToPseudocrumbs < ActiveRecord::Migration
  def change
    add_column :pseudocrumbs, :creator_id, :integer
    add_column :pseudocrumbs, :receiver_id, :integer
  end
end
