require 'rails_helper'

RSpec.describe SelfAssessment, type: :model do
  subject { SelfAssessment.new(name: 'Finance') }

  it 'requires name' do
    subject.name = nil
    is_expected.not_to be_valid
  end

  it 'name is unique' do
    subject.save!
    expect(SelfAssessment.new(name: subject.name)).not_to be_valid
  end
end
