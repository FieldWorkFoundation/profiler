class Answer < ApplicationRecord
  belongs_to :option
  belongs_to :question
  belongs_to :rating

  validates :option, :question, :rating, presence: true
end
