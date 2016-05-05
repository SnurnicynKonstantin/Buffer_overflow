class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      redirect_to(request.referrer || root_path)
    end

    def set_locale
      if cookies[:educator_locale] && I18n.available_locales.include?(cookies[:educator_locale].to_sym)
        lang = cookies[:educator_locale].to_sym
      else
        lang = I18n.default_locale
        cookies.permanent[:educator_locale] = lang
      end
      I18n.locale = lang
    end
end
