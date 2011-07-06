class CasesController < ApplicationController
  before_filter :configure_highrise
  before_filter do
    @current_site = current_site
  end

  def open
    @kases = Highrise::Kase.open
  end

  def closed
    @kases = Highrise::Kase.closed
  end
end
