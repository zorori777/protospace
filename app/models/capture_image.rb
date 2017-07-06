class CaptureImage < ApplicationRecord
  #associtation
  belongs_to :prototype, optional: true
  #image_uploader
  mount_uploader :content, ImageUploader
  #define user_number for images
  enum role: { main: 0, sub: 1 }
end
