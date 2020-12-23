class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :location_id

  belongs_to :user
  has_one_attached :image
end
