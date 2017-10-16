require 'rails_helper'
require 'shared_context'

RSpec.describe Rating, type: :model do
  include_context 'shared context'

  it 'belongs to Assessment' do
    subject.assessment = assessment
    expect(subject.assessment.name).to eq assessment.name
  end

  it 'belongs to Profile' do
    subject.profile = profile
    expect(subject.profile.name).to eq profile.name
  end

  it 'has many Answers' do
    answers = [answer, answer.dup]
    subject.answers << answers
    expect(subject.answers).to match_array answers
  end

  it 'requires Assessment' do
    subject.assessment = nil
    is_expected.not_to be_valid
  end

  it 'requires Profile' do
    subject.profile = nil
    is_expected.not_to be_valid
  end

  it 'requires score' do
    subject.score = nil
    is_expected.not_to be_valid
  end
end
