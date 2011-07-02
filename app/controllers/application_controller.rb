class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  include Userstamp

  require 'highrise'

  def configure_highrise
    if current_site
      Highrise::Base.site = current_site.url
      Highrise::Base.user = current_site.api_token
    else
      flash[:error] = "You must choose which site on which to run reports."
      redirect_to sites_url
    end
  end

  private

    def current_site
      if session[:site_id]
        Site.find(session[:site_id])
      else
        if Site.accessible_by(current_ability).count == 1
          session[:site_id] = Site.accessible_by(current_ability).first.id
        end
      end
    end
end
