class ProfilesController < ApplicationController
  def show
    @profile = Profile.includes(:ratings).find_by(id: params[:id])
    @assessments = SelfAssessment.all
    @checked_assessments = @profile.ratings.pluck(:assessment_id, :id).to_h
  end
end
