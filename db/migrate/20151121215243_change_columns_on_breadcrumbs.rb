class ChangeColumnsOnBreadcrumbs < ActiveRecord::Migration
  def change
    remove_column :breadcrumbs, :geolocation
    remove_column :breadcrumbs, :body
    add_column :breadcrumbs, :lat, :float
    add_column :breadcrumbs, :long, :float
    add_column :breadcrumbs, :title, :string
    add_column :breadcrumbs, :subtitle, :string
  end
end
