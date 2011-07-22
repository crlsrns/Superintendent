class Kase < Highrise::Kase

  def self.active_this_month
    start_of_month  = Time.new( Time.now.year, Time.now.month, 1, 0, 0, 0)
    recordings      = Recording.find_all_across_pages_since(start_of_month)
    case_ids        = recordings.map{ |r| r.case_id }.uniq.select{ |i| i }
    case_ids.map { |i| Kase.find(i) }.sort_by { |c| c.name }
  end

  def self.visible_to_everyone
    self.open.select { |p| p.visible_to == "Everyone" }
  end

end
