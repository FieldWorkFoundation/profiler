require 'rails_helper'
require 'shared_context'

RSpec.describe Profile, type: :model do
  include_context 'shared context'

  subject { profile }

  it 'requires #name' do
    subject.name = nil
    is_expected.not_to be_valid
  end

  it 'requires #country' do
    subject.country = nil
    is_expected.not_to be_valid
  end
end
