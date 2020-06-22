class Property < ApplicationRecord
  validates :property_name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :note, presence: true
  has_many :nearest_stations
  accepts_nested_attributes_for :nearest_stations, allow_destroy: true, reject_if: :all_blank
end
