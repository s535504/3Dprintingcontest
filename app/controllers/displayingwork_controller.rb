class DisplayingworkController < ApplicationController

  before_action :authenticate_user!

  def update
    @displayingwork = Displayingwork.find(params[:id])
    # if Work.find_by(id:params[:col1])
    6.times do
      if work=Work.find_by(displayingwork_id:1)
        work.update_attributes(displayingwork_id:nil)
      end
    end
    @displayingwork.update_attributes(display_params)
    display_params.each do |display_param|
      if work=Work.find_by(id: display_param)
        work.update_attributes(displayingwork_id:1)
      end
    end
    # end
    redirect_to works_url
  end

  private

    def display_params
      params.require(:displayingwork).permit(:col1,:col2,:col3,:col4,:col5,:col6)
    end
end
