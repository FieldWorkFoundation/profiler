require 'rails_helper'
require 'shared_context'

RSpec.describe Answer, type: :model do
  include_context 'shared context'

  it 'belongs to Option' do
    subject.option = option
    expect(subject.option.label).to eq option.label
  end

  it 'belongs to Question' do
    subject.question = question
    expect(subject.question.label).to eq question.label
  end

  it 'belongs to Rating' do
    subject.rating = rating
    expect(subject.rating).to eq rating
  end

  it 'requires Option' do
    subject.option = nil
    is_expected.not_to be_valid
  end

  it 'requires Question' do
    subject.question = nil
    is_expected.not_to be_valid
  end

  it 'requires Rating' do
    subject.rating = nil
    is_expected.not_to be_valid
  end

  it '#score' do
    option.score = 1
    answer.option = option
    expect(answer.score).to eq 1
  end

  it '#score defaults to zero' do
    expect(answer.score).to eq 0
  end
end
