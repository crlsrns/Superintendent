class CasesController < ApplicationController
  before_filter :configure_highrise

  def open
    @kases = Highrise::Kase.open
  end
end
