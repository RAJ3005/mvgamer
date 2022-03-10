class BetsController < ApplicationController
  def index
    @bets = Bet.all
  end

  def create
    @challenge = Challenge.find(params[:challenge_id])
    @bet = Bet.new
    @bet.user = current_user
    @bet.challenge = @challenge

    @wallet_entry = WalletEntry.last

    if @wallet_entry.total < params[:selectedbet].to_i || @wallet_entry.total < params[:quantity].to_i
      flash.alert = "The purchase update failed, try again!"
      # flash.alert
    else
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

      @wallet_entry.total -= @bet.wager
      @wallet_entry.save!
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
