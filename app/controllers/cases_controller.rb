class CasesController < ApplicationController
  before_filter :configure_highrise

  def open
    @kases = Highrise::Kase.open
  end

  def closed
    @kases = Highrise::Kase.closed
  end
end
