require 'rails_helper'
require 'shared_context'

RSpec.describe Question, type: :model do
  include_context 'shared context'

  subject { question }

  it 'belongs to Assessment' do
    subject.assessment = assessment
    expect(subject.assessment.name).to eq assessment.name
  end

  it 'has many Options' do
    options = [option, option.dup]
    subject.options << options
    expect(subject.options).to match_array options
  end

  it 'requires assessment' do
    subject.assessment = nil
    is_expected.not_to be_valid
  end

  it 'requires label' do
    subject.label = nil
    is_expected.not_to be_valid
  end
end
