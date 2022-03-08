class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def dashboard
    @bets = Bet.all
    # @data = kills_fake
    # @data = find_detailed_stats(current_user.gamertag)
    # @kills = @data["summary"]["all"]["kills"]
    # @kd_ratio = @data["summary"]["all"]["kdRatio"].round(2)
    # @time_played = ((@data["summary"]["all"]["timePlayed"]) / 3600.to_f).round(1)
    # binding.pry
  end

  def settings
    @user = current_user

    @wallet_entry = WalletEntry.last

    # if @wallet_entry.update(wallet_entry_params)
    #   flash[:success] = "#{@wallet_entry.amount_cents} has been updated!"
    #   # redirect_to game_path(@game)
    #   redirect_to settings_path
    # else
    #   flash.now[:error] = "The purchase update failed, try again!"
    #   render :edit
    # end
  end


  def statistics
    # @data = kills_fake
    # @data = find_detailed_stats(current_user.gamertag)
    # @sum_kills = []
    # # binding.pry
    # @data["matches"].each_with_index do |k, i|
    #   @sum_kills << [i, k["playerStats"]["kills"]]
      # @data[:matches].each_with_index do |k, i|
      # @sum_kills << [i, k[:playerStats][:kills].to_i]
    # end
  end

  private

  def bet_params
    params.require(:bet).permit(:wager, :payout, :challenge_id)
  end

  # def user_params
  #   params.require(:user).permit(:email, :encrypted_password, :gamertag, :account_balance, :reset_password_token, :reset_password_sent_at, :remember_created_at)
  # end

  def wallet_entry_params
    params.require(:wallet_entry).permit(:state, :amount_cents, :amount_currency, :checkout_session_id, :user_id)
  end

  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        'X-RapidAPI-Host' => URI.parse(url).host,
        'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
      }
    )

    return nil if response.status != 200

    JSON.parse(response.body)
  end

  def find_stats(gamertag)
    request_api(
      "https://call-of-duty-modern-warfare.p.rapidapi.com/warzone/#{gamertag}/battle"
    )
  end

  def find_detailed_stats(gamertag)
    request_api(
      "https://call-of-duty-modern-warfare.p.rapidapi.com/warzone-matches/#{gamertag}/battle"
    )
  end
end
