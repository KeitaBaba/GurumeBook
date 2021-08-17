class Shop < ApplicationRecord
    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :reviews, dependent: :destroy
    mount_uploaders :images, ImageUploader
end
