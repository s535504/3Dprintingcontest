class StaticPagesController < ApplicationController
  def home
  end

  def info
  end

  def notify
    @register = Register.new(name:"Van",email:"dark@gmail.com")
    @register.save
  end
end
