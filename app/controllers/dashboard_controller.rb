class DashboardController < ApplicationController
  require 'cryptocompare'

  def index
    if !current_user
      respond_to do |format|
        format.html { redirect_to new_session_path }
      end
    end

    @btc_to_eu = Cryptocompare::Price.find('BTC', 'EUR')
    @eu_to_btc = Cryptocompare::Price.find('EUR', 'BTC')
    @bitcoin =  Cryptocompare::CoinList.all["Data"]["BTC"]
    @coinlists = Cryptocompare::CoinList.all["Data"]
  end
end
