class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :set_locale

  include Userstamp

  require 'highrise'

  private

    def configure_highrise
      if current_site
        Highrise::Base.site = current_site.url
        Highrise::Base.user = current_site.api_token
      else
        redirect_to sites_url, :alert => "You must choose on which site to run reports."
      end
    end

    def current_site
      session[:site_id] ||= Site.accessible_by(current_ability).first.id
      Site.find(session[:site_id])
    end

    def default_url_options(options={})
      { :locale => I18n.locale }
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

end
