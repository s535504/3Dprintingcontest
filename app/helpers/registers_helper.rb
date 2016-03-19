module RegistersHelper

  def hasTdmfile?(register)
    register.tdmfiles.count==0
  end
end
