class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :location_id

  belongs_to :user
  has_one_attached :image
  validates :title, :explanation, :image, presence: true

  validates :category_id, :location_id, numericality: { other_than: 1 } 
end
