class CasesController < ApplicationController
  before_filter :configure_highrise
  before_filter do
    @current_site = current_site
  end

  def index
    if params[:attribute] == "open"
      @page_title = "Open Cases"
      @kases = Highrise::Kase.open
    elsif params[:attribute] == "closed"
      @page_title = "Closed Cases"
      @kases = Highrise::Kase.closed
    elsif params[:attribute] == "active_this_month"
      @page_title = "Cases Active This Month"
      @kases = Kase.active_this_month
    else
      redirect_to :home, :alert => "That report does not exist"
    end
  end
end
