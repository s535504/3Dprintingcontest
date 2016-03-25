module SessionsHelper

  def seletedlanguage(la)
    cookies.permanent[:language]=la
  end
end
