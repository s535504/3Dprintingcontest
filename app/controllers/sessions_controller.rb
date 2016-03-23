class SessionsController < ApplicationController
  def new
  end

  def create
    seletedlanguage params[:language]
    redirect_back_to :back
  end
end
