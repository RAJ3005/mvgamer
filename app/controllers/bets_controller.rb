class BetsController < ApplicationController
  def index
    @bets = Bet.all
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @bet = Bet.new
    @bet.user = current_user
    @bet.challenge = @challenge

    if params[:quantity] == "" || params[:quantity].nil?
      @bet.wager = params[:selectedbet].to_i
    else
      @bet.wager = params[:quantity].to_i
    end

    @bet.payout = @bet.wager * 2
    # @bet.payout = params[:selectedbet].to_i * 2
     # raise

    # raise # params = @bet  nil
    if @bet.save!
      redirect_to challenges_path
    end
  end

  def completion
    @bet = Bet.find(params[:bet_id])
    @bet.completion = params[:completion]
    @bet.save
    redirect_to dashboard_path
  end

  private

end
