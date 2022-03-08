class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_wallet
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:gamertag])
  end

  private

  def set_wallet
    @wallet_entry = WalletEntry.last
  end
end
