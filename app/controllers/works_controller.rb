class WorksController < ApplicationController

  before_action :authenticate_user!, only:[:index,:create,:destroy]

  def index
    @work = Work.new
    @works = Work.all
    @displayingwork = Displayingwork.first
  end

  def show
    @work = Work.find(params[:id])
  end

  def create
    @work = Work.new(work_params)
    @work.save
    callreturn
    redirect_to works_url
  end

  def destroy
    Work.find(params[:id]).destroy
    callreturn
    redirect_to works_url
  end

  private

    def update_param
      params.require(:work1).permit(:id)
    end

    def work_params
      params.require(:work).permit(:picture, :workname, :name)
    end

    def callreturn
      @work = Work.new
      @works = Work.all
    end
end
