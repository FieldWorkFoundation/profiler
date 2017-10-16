require 'rails_helper'
require 'shared_context'

RSpec.describe SelfAssessment, type: :model do
  include_context 'shared context'

  subject { assessment }

  it 'has many Questions' do
    questions = [question, question.dup]
    subject.questions << questions
    expect(subject.questions).to match_array questions
  end

  it 'has many Ratings' do
    ratings = [rating, rating.dup]
    subject.ratings << ratings
    expect(subject.ratings).to match_array ratings
  end

  it 'requires name' do
    subject.name = nil
    is_expected.not_to be_valid
  end

  it 'name is unique' do
    subject.save!
    expect(subject.dup).not_to be_valid
  end
end
