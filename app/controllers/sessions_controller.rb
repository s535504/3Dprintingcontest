class SessionsController < ApplicationController
  def new
  end

  def create
    seletedlanguage params[:session][:language]
    redirect_back_to :back
  end
end
