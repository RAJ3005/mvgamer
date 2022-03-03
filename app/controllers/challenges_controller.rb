class ChallengesController < ApplicationController
  before_action :set_challenges, only: [:show]

  def index
    @challenges = Challenge.all
    # binding.pry
    # @data = find_detailed_stats(current_user.gamertag)
  end

  def statistics
    # I want to have a detailed statistics separate view and don't want to create another controller etc
  end

  def show
    @challenge = Challenge.find(params[:id])
    @bet = Bet.new
    @bet.challenge_id = @challenge.id
  end

  private

  def set_challenges
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:title, :description, :gamertag, :odds)
  end

  # def request_api(url)
  #   response = Excon.get(
  #     url,
  #     headers: {
  #       'X-RapidAPI-Host' => URI.parse(url).host,
  #       'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
  #     }
  #   )

  #   return nil if response.status != 200

  #   JSON.parse(response.body)
  # end

  # def find_stats(gamertag)
  #   request_api(
  #     "https://call-of-duty-modern-warfare.p.rapidapi.com/warzone/#{gamertag}/battle"
  #   )
  # end

  # def find_detailed_stats(gamertag)
  #   request_api(
  #     "https://call-of-duty-modern-warfare.p.rapidapi.com/warzone-matches/#{gamertag}/battle"
  #   )
  # end
end
