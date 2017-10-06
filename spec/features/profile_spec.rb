require 'rails_helper'

RSpec.feature 'Profile', type: :feature do
  let(:profile) { Profile.create!(name: 'NGO', country: 'Kenya') }

  scenario 'User can view Profile' do
    visit profile_path(profile)
    expect(current_path).to eq profile_path(profile)
  end
end
