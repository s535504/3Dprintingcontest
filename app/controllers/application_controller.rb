class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :set_locale

  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
    @lan=I18n.locale
  end

  private

    def extract_locale_from_accept_language_header
      request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      #   when 'zh'
      #     'zh'
      #   else
      #     'en'
      # end
    end

    def check_language
      unless have_language?
        store_location
        redirect_to language_url
      end
    end
end
