class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @data = find_detailed_stats(current_user.gamertag)


  end

  private

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
