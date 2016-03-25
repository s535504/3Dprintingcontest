class SessionsController < ApplicationController
  def new
  end

  def create
    seletedlanguage params[:language]
    redirect_to :back
  end
end
