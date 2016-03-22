module SessionsHelper

  def have_language?
    !cookies[:language].nil?
  end

  def seletedlanguage(la)
    cookies.permanent[:language]=la
  end

  def language
    cookies[:language]
  end

  def redirect_back_to(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url]=request.url if request.get?
  end
end
