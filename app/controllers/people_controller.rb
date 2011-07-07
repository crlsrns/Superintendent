class PeopleController < ApplicationController
  before_filter :configure_highrise
  before_filter do
    @current_site = current_site
  end

  def index
    if params[:attribute] == "all"
      @page_title = "People"
      @people = Person.find_all_across_pages
    elsif params[:attribute] == "without_last_name"
      @page_title = "People without Last Name"
      @people = Person.without_last_name
    else
      redirect_to :home, :alert => "That report does not exist"
    end
  end

end
