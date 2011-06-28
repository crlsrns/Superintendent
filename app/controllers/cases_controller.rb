class CasesController < ApplicationController
  def open
    configure_highrise
    @kases = Highrise::Kase.open
  end
end
