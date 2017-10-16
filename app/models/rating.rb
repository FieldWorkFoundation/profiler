class Rating < ApplicationRecord
  belongs_to :profile
  belongs_to :assessment, polymorphic: true

  validates :profile, :assessment, :score, presence: true
end
