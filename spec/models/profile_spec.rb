require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject do
    Profile.new(name: 'NGO', country: 'Kenya')
  end

  it 'requires #name' do
    subject.name = nil
    is_expected.not_to be_valid
  end

  it 'requires #country' do
    subject.country = nil
    is_expected.not_to be_valid
  end
end
