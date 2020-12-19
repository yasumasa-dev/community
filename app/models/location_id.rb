class LocationId < ApplicationRecord
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'オンライン' },
    { id: 3, name: '高知市内' },
    { id: 4, name: '県外' }
  ]

  include ActiveHash::Associations
  has_many :events
end
