module SessionsHelper

  def have_language?
    !session[:language].nil?
  end

  def seletedlanguage(la)
    session[:language]=la
  end

  def language
    session[:language]
  end

  def redirect_back_to(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url]=request.url if request.get?
  end
end
