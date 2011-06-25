class CasesController < ApplicationController
  require 'highrise'

  def index
    configure_highrise
    @open_kases = Highrise::Kase.open
  end

  private

    def configure_highrise
      Highrise::Base.site = Site.first.url
      Highrise::Base.user = Token.first.value
    end

end
