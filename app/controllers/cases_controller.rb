class CasesController < ApplicationController
  def index
    configure_highrise
    @open_kases = Highrise::Kase.open
  end
end
