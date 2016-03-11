module StaticPagesHelper

  def isHome?
    request.url==root_url
  end
end
