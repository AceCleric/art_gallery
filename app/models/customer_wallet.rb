class CustomerWallet < ApplicationRecord
  before_action :set_wallet, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_wallet
  # GET /wallets
  # GET /wallets.json
  def index
    @wallets = CustomerWallet.all
  end

  # GET /wallets/1
  # GET /wallets/1.json
  def show
  end

  # GET /wallets/new
  def new
    @wallet = CustomerWallet.new
  end

  # GET /wallets/1/edit
  def edit
  end

  # POST /wallets
  # POST /wallets.json
  def create
    @wallet = CustomerWallet.new(wallet_params)

    respond_to do |format|
      if @wallet.save
        format.html { redirect_to @wallet, notice: 'Wallet was successfully created.' }
        format.json { render :show, status: :created, location: @wallet }
      else
        format.html { render :new }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wallets/1
  # PATCH/PUT /wallets/1.json
  def update
    respond_to do |format|
      if @wallet.update(wallet_params)
        format.html { redirect_to @wallet, notice: 'CustomerWallet was successfully updated.' }
        format.json { render :show, status: :ok, location: @wallet }
      else
        format.html { render :edit }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallets/1
  # DELETE /wallets/1.json
  def destroy
    @wallet.destroy if @wallet.id == session[:wallet_id]
    session[:wallet_id] = nil
    respond_to do |format|
      format.html { redirect_to store_index_url }
        format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = CustomerWallet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wallet_params
      params.fetch(:wallet, {})
    end
    def invalid_wallet
      logger.error "Attempt to access invalid wallet #{params[:id]}"
      redirect_to store_index_url, notice: 'Invalid wallet'
    end
end
