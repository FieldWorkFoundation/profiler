class Question < ApplicationRecord
  belongs_to :assessment, polymorphic: true
  has_many :answers
  has_many :options, dependent: :destroy

  validates :assessment, :label, presence: true
end
