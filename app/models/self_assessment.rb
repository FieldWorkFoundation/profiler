class SelfAssessment < ApplicationRecord
  has_many :questions, as: :assessment

  validates :name, presence: true, uniqueness: true
end
