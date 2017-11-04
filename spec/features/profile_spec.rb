require 'rails_helper'
require 'shared_context'

RSpec.feature 'Profile', type: :feature do
  include_context 'shared context'

  before { profile.save! }

  scenario 'User can view Profile' do
    visit profile_path(profile)
    expect(current_path).to eq profile_path(profile)
  end
end
