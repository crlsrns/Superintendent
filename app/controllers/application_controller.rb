class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'highrise'

  def configure_highrise
    Highrise::Base.site = Site.first.url
    Highrise::Base.user = Token.first.value
  end

end
