class NearestStation < ApplicationRecord
  validates :route, presence: true
  validates :station, presence: true
  validates :minutes_walk, presence: true
  belongs_to :property
end
