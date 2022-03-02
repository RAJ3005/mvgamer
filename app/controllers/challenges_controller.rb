class ChallengesController < ApplicationController
  before_action :set_challenges, only: [:show]

  def index
    @challenges = Challenge.all
  end

  def show
  end

  private

  def set_challenges
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:title, :description, :gamertag, :odds)
  end
end
