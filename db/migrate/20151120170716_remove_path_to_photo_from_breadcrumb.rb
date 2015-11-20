class RemovePathToPhotoFromBreadcrumb < ActiveRecord::Migration
  def change
    remove_column :breadcrumbs, :path_to_photo
  end
end
