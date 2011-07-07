module PeopleHelper

  def url_to_person(person_id)
    @current_site.url + '/people/' + person_id.to_s
  end

end
