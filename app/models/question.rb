class Question < ApplicationRecord
  belongs_to :assessment, polymorphic: true

  validates :assessment, :label, presence: true
end
