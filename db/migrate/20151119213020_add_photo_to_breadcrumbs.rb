class AddPhotoToBreadcrumbs < ActiveRecord::Migration
  def change
    add_attachment :breadcrumbs, :photo
  end
end
