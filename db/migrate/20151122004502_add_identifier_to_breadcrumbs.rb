class AddIdentifierToBreadcrumbs < ActiveRecord::Migration
  def change
    add_column :breadcrumbs, :identifier, :string
  end
end
