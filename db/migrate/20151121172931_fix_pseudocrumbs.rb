class FixPseudocrumbs < ActiveRecord::Migration
  def change
    remove_column :pseudocrumbs, :message
    add_column :pseudocrumbs, :title, :string
    add_column :pseudocrumbs, :subtitle, :string
  end
end
