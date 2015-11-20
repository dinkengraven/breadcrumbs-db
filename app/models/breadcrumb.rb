class Breadcrumb < ActiveRecord::Base
  has_attached_file :photo, :storage => :s3, :bucket => 'breadcrumbs-assets'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
