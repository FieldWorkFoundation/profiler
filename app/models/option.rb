class Option < ApplicationRecord
  belongs_to :question

  validates :question, :label, :score, presence: :true
end
