require 'stringio'
require 'base64'

class Breadcrumb < ActiveRecord::Base
  has_attached_file :photo, :storage => :s3, :bucket => 'breadcrumbs-assets'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  attr_accessor :image_data

  before_save :decode_image_data

  def decode_image_data
    if self.image_data.present?
      # If image_data is present, it means that we were sent an image over
      # JSON and it needs to be decoded.  After decoding, the image is processed
      # normally via Paperclip.
      if self.image_data.present?
          data = StringIO.new(Base64.decode64(self.image_data))
          data.class.class_eval {attr_accessor :original_filename, :content_type}
          data.original_filename = self.id.to_s + ".png"
          data.content_type = "image/png"

          self.photo = data
      end
    end
  end
end
