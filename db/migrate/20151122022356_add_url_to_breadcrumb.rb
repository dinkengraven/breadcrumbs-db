class AddUrlToBreadcrumb < ActiveRecord::Migration
  def change
    add_column :breadcrumbs, :photo_aws_url, :string
  end
end
