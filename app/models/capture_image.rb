class CaptureImage < ApplicationRecord
  #associtation
  belongs_to :prototype, optional: true
  #image_uploader
  mount_uploader :content, ImageUploader
end
