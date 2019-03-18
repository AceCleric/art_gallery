class ArtPiecesController < ApplicationController
  before_action :set_art_piece, only: %i[show edit update destroy]

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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @art_piece.destroy
    respond_to do |format|
      format.html { redirect_to art_pieces_url, notice: 'Art piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_art_piece
    @art_piece = ArtPiece.find(params[:id])
  end

  def set_art_pieces
    @art_pieces = parent.art_piece
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def art_piece_params
    params.require(:art_piece).permit(:name, :artist, :rentprice, :image_url, :length, :width, :surface, :built_in)
  end

end
