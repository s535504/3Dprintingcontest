class TdmfilesController < ApplicationController

  def create
    @register=Register.find_by(email:tdmfile_params["email"])
    @tdmfile = @register.tdmfiles.create(:igsfile=>tdmfile_params["igs"])
    redirect_to registers_path
  end

  def destroy
  end

  private

    def tdmfile_params
      params.require(:tdmfile).permit(:email,:igs)
    end
end
