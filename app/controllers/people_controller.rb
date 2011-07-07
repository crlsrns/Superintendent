class PeopleController < ApplicationController
  before_filter :configure_highrise
  before_filter do
    @current_site = current_site
  end

  def index
    @page_title = "People"
    @people = Person.find_all_across_pages
  end

  def without_last_name
    @page_title = "People without Last Name"
    @people = Person.without_last_name
    render :index
  end
end
