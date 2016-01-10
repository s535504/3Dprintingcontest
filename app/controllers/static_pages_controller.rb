class StaticPagesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:notify]
  
  def home
  end

  def info
  end

  def notify
    register = Register.new(name:"Van", email:"dark@gmail.com")
    register.save
  end
end
