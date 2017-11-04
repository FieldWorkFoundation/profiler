require 'rails_helper'
require 'shared_context'

RSpec.feature 'Profile', type: :feature do
  include_context 'shared context'

  before do
    profile.save!
    assessment.save!
    visit profile_path(profile)
  end

  scenario 'User can view Profile' do
    expect(current_path).to eq profile_path(profile)
  end

  scenario 'incomplete Assessments show new link' do
    expect(page).to have_text 'New'
  end

  scenario 'complete Assessments show edit link' do
    rating.save!
    visit profile_path(profile)
    expect(page).to have_text 'Edit'
  end
end
