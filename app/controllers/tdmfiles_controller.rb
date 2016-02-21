class TdmfilesController < ApplicationController

  def create
    if params[:email]!=nil
      @register=Register.find_by(email:params[:email])
    else
      redirect_to root_url
    end
    if params[:tdmfile]!=nil && !@register.tdmfiles.any?
      tdm=params[:tdmfile]
      if tdm['picture1']!=nil || tdm['picture2']!=nil || tdm['picture3']!=nil
        @tdmfile = @register.tdmfiles.build(tdmfile_params)
        @tdmfile.save
      end
    end
    # redirect_to "http://localhost:3000/registers?utf8=%E2%9C%93&search="+CGI::escape(@register.email)+"&n="+CGI::escape(@register.name)
    redirect_to "http://tdpcontest.herokuapp.com/registers?utf8=%E2%9C%93&search="+CGI::escape(@register.email)+"&n="+CGI::escape(@register.name)
  end

  def destroy
  end

  private

    def tdmfile_params
      params.require(:tdmfile).permit(:igsfile, :picture1, :picture2, :picture3)
    end
end
