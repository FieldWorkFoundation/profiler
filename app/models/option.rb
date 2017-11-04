class Option < ApplicationRecord
  belongs_to :question
  has_many :answers

  validates :question, :label, :score, presence: :true
end
