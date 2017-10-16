class SelfAssessment < ApplicationRecord
  has_many :questions, as: :assessment
  has_many :ratings, as: :assessment

  validates :name, presence: true, uniqueness: true
end
