class Person < Highrise::Person

  def self.without_last_name
    self.find_all_across_pages.select { |p| p.last_name.blank? }
  end

end
