module CurrentWallet

  private

  def set_wallet
    @wallet = CustomerWallet.find(session[:wallet_id])
  rescue ActiveRecord::RecordNotFound
    @wallet = CustomerWallet.create
    session[:wallet_id] = @wallet.id
  end
end
