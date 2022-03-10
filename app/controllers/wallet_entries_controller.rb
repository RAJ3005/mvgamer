class WalletEntriesController < ApplicationController
  before_action :set_user, :set_wallet_entry, only: [:update]

  def edit
    # @wallet_entry = WalletEntry.new
    @wallet_entry = WalletEntry.find_by(user: current_user)
  end

  def update
    # binding.pry
    @wallet_entry = WalletEntry.find_by(user: current_user)
    # user = current_user
    # @wallet_entry = WalletEntry.last

    if @wallet_entry.update!(wallet_entry_params)
      # flash[:success] = "#{@wallet_entry.amount_cents} has been updated!"
      # redirect_to game_path(@game)
      # redirect_to settings_path
    else
      flash.now[:error] = "The purchase update failed, try again!"
      render :edit && return
    end

    @wallet_entry.total += @wallet_entry.amount_cents
    @wallet_entry.save!

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Adding £#{@wallet_entry.amount_cents} into user account",
        # params[:wallet_entry][:amount_cents]}
        # amount: params[:wallet_entry][:amount_cents].to_i,
        amount: @wallet_entry.amount_cents * 100,
        # params[:wallet_entry][:amount_cents].to_i,
        currency: "gbp",
        quantity: 1
      }],
      success_url: wallet_entry_url(@wallet_entry),
      cancel_url: wallet_entry_url(@wallet_entry)
    )

    # binding.pry

    @wallet_entry.update(checkout_session_id: session.id)
    # redirect_to new_wallet_entry_payment_path(wallet_entry)
    redirect_to edit_wallet_entry_path(@wallet_entry)
  end

  def create
    # bet = Bet.find(params[:bet_id])
    # user = current_user

    # wallet_entry = WalletEntry.create!(
    #   # bet: bet,
    #   amount_cents: 500,
    #   state: 'pending',
    #   user: current_user
    # )

    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     name: "£5 purchase",
    #     amount: 500,
    #     currency: gbp,
    #     quantity: 1
    #   }],
    #   success_url: wallet_entry_url(wallet_entry),
    #   cancel_url: wallet_entry_url(wallet_entry)
    # )

    # wallet_entry.update(checkout_session_id: session_id)
    # redirect_to new_wallet_entry_payment_path(wallet_entry)
  end

  def show
    @wallet_entry = current_user.wallet_entries.find(params[:id])
  end

  private

  def set_user
    @user = current_user
  end

  def set_wallet_entry
    @wallet_entry = WalletEntry.last
  end

  # def update_amount_cents
  #   if @wallet_entry.update!(wallet_entry_params)
  #     flash[:success] = "#{@wallet_entry.amount_cents} has been updated!"
  #     # redirect_to game_path(@game)
  #     # redirect_to settings_path
  #   else
  #     flash.now[:error] = "The purchase update failed, try again!"
  #     render :edit
  #   end

  #   @wallet_entry.total += @wallet_entry.amount_cents
  #   @wallet_entry.save!
  # end

  def wallet_entry_params
    params.require(:wallet_entry).permit(:state, :amount_cents, :amount_currency, :checkout_session_id, :user_id)
  end
end
