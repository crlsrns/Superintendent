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
    else
      redirect_to :home, :alert => "That report does not exist"
    end
  end
end
