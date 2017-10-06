class Profile < ApplicationRecord
  validates :name, :country, presence: true
end
