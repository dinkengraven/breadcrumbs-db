class AddFoundToPseudocrumb < ActiveRecord::Migration
  def change
    add_column :pseudocrumbs, :found, :boolean, :default => false
  end
end
