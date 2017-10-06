class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(id: params[:id])
  end
end
