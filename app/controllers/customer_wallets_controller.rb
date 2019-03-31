class CustomerWalletsController < ApplicationController
  before_action :set_customer_wallet, only: %i[show edit update destroy]

  def index
    @customer_wallets = CustomerWallet.all
  end

  def show
  end

  def new
    @customer_wallet = CustomerWallet.new
  end

  def edit
  end

  def create
    @customer_wallet = CustomerWallet.new(customer_wallet_params)

    respond_to do |format|
      if @customer_wallet.save
        format.html { redirect_to @customer_wallet, notice: 'Customer Wallet was successfully created.' }
        format.json { render :show, status: :created, location: @customer_wallet }
      else
        format.html { render :new }
        format.json { render json: @customer_wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @customer_wallet.update(customer_wallet_params)
        format.html { redirect_to "/users/#{@customer_wallet.user_id}", notice: 'Customer Wallet was successfully updated.' }
      else
        format.json { render json: @customer_wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @customer_wallet.destroy
    respond_to do |format|
      format.html { redirect_to customer_wallets_url, notice: 'Customer Wallet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer_wallet
    @customer_wallet = CustomerWallet.find(params[:id])
  end

  def set_customer_wallets
    @customer_wallets = parent.art_piece
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_wallet_params
    params.require(:customer_wallet).permit(:wallet_value, :user_id, :add_value, :remove_value)
  end

end
