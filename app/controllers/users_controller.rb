class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    @user.save
    created_user = User.find_by(email: @user.email)

    @customer_wallet = CustomerWallet.create(wallet_value: 50, user_id: created_user.id)

    @user.update(customer_wallet_id: @customer_wallet.id)

    @user.customer_wallet = @customer_wallet

    respond_to do |format|
      if @user.save
        format.html { redirect_to new_session_path, notice: 'User was successfully created.' }
        format.json { render new_session_path, status: :created }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_rented_art_piece
    set_user

    art_piece = ArtPiece.find_by(user_id: @user.id)
    art_piece.update_columns(user_id: nil)
    redirect_to user_path(@user.id), notice: "#{art_piece.name} beschikbaar gesteld!"
  end

  private

    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :customers_id)
    end
end
