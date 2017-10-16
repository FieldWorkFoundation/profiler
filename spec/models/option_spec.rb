require 'rails_helper'
require 'shared_context'

RSpec.describe Option, type: :model do
  include_context 'shared context'

  subject { option }

  it 'belongs to Question' do
    subject.question = question
    expect(subject.question).to eq question
  end

  it 'has many Answers' do
    answers = [answer, answer.dup]
    subject.answers << answers
    expect(subject.answers).to match_array answers
  end

  it 'requires question' do
    subject.question = nil
    is_expected.not_to be_valid
  end

  it 'requires label' do
    subject.label = nil
    is_expected.not_to be_valid
  end

  it 'requires score' do
    subject.score = nil
    is_expected.not_to be_valid
  end
end
