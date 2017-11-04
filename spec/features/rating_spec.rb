require 'rails_helper'
require 'shared_context'

RSpec.feature 'Rating', type: :feature do
  include_context 'shared context'

  before do
    profile.save!
    assessment.save!
    assessment.questions << question
    option2 = option.dup
    option2.label = 'No'
    question.options << [option, option2]
  end

  scenario 'User can create Rating' do
    visit new_profile_assessment_rating_path(profile, assessment)
    expect(page).to have_text 'Finance'
    expect(page).to have_text 'Have a budget'

    choose('No')
    click_button
    expect(current_path).to eq profile_path(profile)
  end

  scenario 'User can only create one Rating per Assessment' do
    rating.save!
    visit new_profile_assessment_rating_path(profile, assessment)
    expect(current_path).to eq profile_path(profile)
  end

  scenario 'User can edit Rating' do
    rating.save!
    visit profile_path(profile)
    click_link('Edit')
    expect(current_path).to eq edit_profile_assessment_rating_path(profile, assessment, Rating.last)

    choose('Yes')
    click_button
    expect(current_path).to eq profile_path(profile)
  end
end
