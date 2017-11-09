class ProfilesController < ApplicationController
  def show
    @profile = Profile.includes(:ratings).find_by(id: params[:id])
    @assessments = SelfAssessment.all
    @checked_assessments = @profile.ratings.map do |r|
      [r.assessment_id, r]
    end.to_h
  end
end
