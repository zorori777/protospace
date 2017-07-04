class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :profile, presence: true
  mount_uploader :image, ImageUploader
  has_many :users
end
