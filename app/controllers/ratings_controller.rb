class RatingsController < ApplicationController
  before_action :load_profile, :load_assessment, only: %i[new create]

  def new
    @rating = @assessment.ratings
                         .where(profile_id: params[:profile_id])
                         .first_or_initialize
    return redirect_to profile_path(@profile) if @rating.persisted?
    @answers = answer_fields(@rating)
  end

  def create
    @rating = @assessment.ratings.new(params_whitelist)
    @answers = answer_fields(@rating)
    if @rating.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  private

  def params_whitelist
    params.require(:rating)
          .permit(:profile_id, answers_attributes: %i[id question_id option_id])
  end

  def load_profile
    @profile = Profile.find_by(id: params[:profile_id])
  end

  def load_assessment
    @assessment = SelfAssessment.find_by(id: params[:assessment_id])
  end

  def answer_fields(rating)
    if rating.answers.any?
      rating.answers
    else
      rating.assessment.questions.map { |q| Answer.new(question_id: q.id) }
    end
  end
end
