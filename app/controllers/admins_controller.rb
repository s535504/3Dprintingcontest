class AdminsController < ApplicationController

  before_action :authenticate_user!

  def registermanagement
    order=params[:order]
    if order=="1"
      @registers=Register.all.order("name DESC")
      @nameorder=2
      @nametri=true
    elsif order=="2"
      @registers=Register.all.order("name ASC")
      @nameorder=1
      @nametri=true
    elsif order=="3"
      @registers=Register.all.order("email DESC")
      @emailorder=4
      @emailtri=true
    elsif order=="4"
      @registers=Register.all.order("email ASC")
      @emailorder=3
      @emailtri=true
    elsif order=="5"
      @registers=Register.all.order("paystatus DESC")
      @paidorder=6
      @paidtri=true
    elsif order=="6"
      @registers=Register.all.order("paystatus ASC")
      @paidorder=5
      @paidtri=true
    else
      @registers=Register.all
    end
    if @nametri==true
      @emailtri=false
      @paidtri=false
    elsif @emailtri==true
      @nametri=false
      @paidtri=false
    elsif @paidtri==true
      @nametri=false
      @emailtri=false
    end
    @paidamount=0
    @todayregister=0
    @registers.all.each do |register|
      if register.created_at.strftime("%d")==Time.now.strftime("%d")
        @todayregister+=1
      end
    end
    @unpaidamount=0
    @erroramount=0
    @errprprofit=0
    @registers.each do |register|
      if register.paystatus==3
        @paidamount+=1
      elsif register.paystatus==1
        @paidamount+=1
        @erroramount+=1
        transaction=register.transactions.find_by("params -> 'RtnCode' = '1' OR params -> 'TradeStatus' = '1'")
        @errprprofit=@errprprofit+transaction.params['TradeAmt'].to_i
      else
        @unpaidamount+=1
      end
    end
  end

  def filemanagement
    @tdmfiles=Tdmfile.all
  end
end
