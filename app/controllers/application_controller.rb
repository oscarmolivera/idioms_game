class ApplicationController < ActionController::Base
  before_action :set_locale
  include Pundit
  include Pagy::Backend
  protect_from_forgery with: :null_session, only: [:create]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
