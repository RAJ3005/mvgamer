class WalletEntriesController < ApplicationController
  def create
    bet = Bet.find(params[:bet_id])
    wallet_entry = WalletEntry.create!(
      bet: bet,
      amount: bet.price_cents,
      state: 'pending',
      user: current_user
    )

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: bet.challenge_id,
        amount: bet.price_cents,
        currency: gbp,
        quantity: 1
      }],
      success_url: wallet_entry_url(wallet_entry),
      cancel_url: wallet_entry_url(wallet_entry)
    )

    wallet_entry.update(checkout_session_id: session_id)
    redirect_to new_wallet_entry_payment_path(order)
  end
end
