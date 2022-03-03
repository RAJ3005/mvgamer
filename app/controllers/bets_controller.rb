class BetsController < ApplicationController
  def create
    @bet = Bet.new(bet_params)
    @bet.user = current_user
    if @bet.save!
      redirect_to challanges_path
    end
  end

  private
  def bet_params
    params.require(:bet).permit(:wager, :payout, :challenge_id)
  end
end
