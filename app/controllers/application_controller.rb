class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :set_locale

  include Userstamp

  require 'highrise'

  def configure_highrise
    if current_site
      Highrise::Base.site = current_site.url
      Highrise::Base.user = current_site.api_token
      @current_site = current_site
    else
      flash[:error] = "Register a site before trying to run reports on it."
      redirect_to sites_url
    end
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
#    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end
  
  private

    def current_site
      Site.find(session[:site_id])
    rescue ActiveRecord::RecordNotFound
      site = Site.accessible_by(current_ability).first
      session[:site_id] = site.id
      site
    end
end
