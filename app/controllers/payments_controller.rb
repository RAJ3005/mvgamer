class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def new
    @wallet_entry = current_user.wallet_entries.where(state: 'pending').find(params[:wallet_entry_id])
  end
end
