class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validation
  validates :name, :profile, presence: true
  # posting image
  mount_uploader :image, ImageUploader
  # association
  has_many :prototypes
  has_many :comments
  has_many :likes
end
