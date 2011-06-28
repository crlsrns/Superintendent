class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  include Userstamp

  require 'highrise'

  def configure_highrise
    Highrise::Base.site = Site.first.url
    Highrise::Base.user = Site.first.api_token
  end

end
