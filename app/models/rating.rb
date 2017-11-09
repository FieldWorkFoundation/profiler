class Rating < ApplicationRecord
  belongs_to :profile
  belongs_to :assessment, polymorphic: true
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :profile, :assessment, :score, presence: true

  def save(*args)
    self[:score] = answers.map(&:score).reduce(&:+)
    super
  end
end
