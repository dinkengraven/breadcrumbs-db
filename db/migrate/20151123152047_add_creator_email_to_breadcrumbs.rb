class AddCreatorEmailToBreadcrumbs < ActiveRecord::Migration
  def change
    add_column :breadcrumbs, :creator_email, :string
  end
end
