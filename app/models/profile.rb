class Profile < ApplicationRecord
  has_many :ratings

  validates :name, :country, presence: true
end
