class BetsController < ApplicationController
  def index
    @bets = Bet.all
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @bet = Bet.new(bet_params)
    @bet.user = current_user
    @bet.challenge = @challenge

    # raise # params = @bet  nil
    if @bet.save!
      redirect_to challenges_path
    end
  end

  private
  def bet_params
    params.require(:bet).permit(:wager, :payout, :challenge_id)
  end
end
