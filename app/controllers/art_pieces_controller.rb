class ArtPiecesController < ApplicationController
  before_action :set_art_piece, only: %i[show edit update destroy]
  helper_method :find_user_name

  def index
    @art_pieces = ArtPiece.all
  end

  def show
  end

  def new
    @art_piece = ArtPiece.new
  end

  def edit
  end

  def create
    @art_piece = ArtPiece.new(art_piece_params)

    respond_to do |format|
      if @art_piece.save
        format.html { redirect_to @art_piece, notice: 'Art piece was successfully created.' }
        format.json { render :show, status: :created, location: @art_piece }
      else
        format.html { render :new }
        format.json { render json: @art_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @art_piece.update(art_piece_params)
        format.html { redirect_to @art_piece, notice: 'Art piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @art_piece }
      else
        format.html { render :edit }
        format.json { render json: @art_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @art_piece.destroy
    respond_to do |format|
      format.html { redirect_to art_pieces_url, notice: 'Art piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rent_art_piece
    user = current_user
    set_art_piece
    if user.customer_wallet.wallet_value < @art_piece.rentprice
      redirect_to art_piece_path(@art_piece.id), notice: 'Transaction is gefaald. Te weinig saldo.'
    else
      transaction = user.customer_wallet.wallet_value - @art_piece.rentprice
      @art_piece.update_columns(user_id: user.id)
      user.customer_wallet.update_columns(wallet_value: transaction)
      redirect_to art_piece_path(@art_piece.id), notice: 'Transactie is geslaagd!'
    end
  end

  def find_user_name(art_piece_id)
    set_art_piece

    User.find(art_piece_id).name
  end

  private

  def set_art_piece
    @art_piece = ArtPiece.find(params[:id])
  end

  def set_art_pieces
    @art_pieces = parent.art_piece
  end

  def art_piece_params
    params.require(:art_piece).permit(:name, :artist, :rentprice, :image_url, :length, :width, :surface, :built_in)
  end

end
