class BannersController < ApplicationController

  before_action :authenticate_user!

  def index
    @banners=Banner.all.order(:id)
  end

  def update
    banner=Banner.find(params[:id])
    banner.update_attributes(banner_params)
    redirect_to banners_url
  end

  private

    def banner_params
      params.require(:banner).permit(:picture,:url)
    end
end
