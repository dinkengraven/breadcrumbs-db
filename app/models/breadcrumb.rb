require 'stringio'
require 'base64'

class Breadcrumb < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :receiver, class_name: "User"

  has_attached_file :photo, :storage => :s3, :bucket => 'breadcrumbs-assets'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  attr_accessor :image_data

  before_save :decode_image_data, :set_url_for_aws
  after_save  :set_creator_email

  def decode_image_data
    if self.image_data.present?
      if self.image_data.present?
        data = StringIO.new(Base64.decode64(self.image_data))
        data.class.class_eval {attr_accessor :original_filename, :content_type}
        data.original_filename = self.id.to_s + ".png"
        data.content_type = "image/png"

        self.photo = data
      end
    end
  end

  def set_url_for_aws
    self.photo_aws_url = self.photo.url
  end

  def set_creator_email
    self.creator_email = self.creator.email
  end
end
