class Kase < Highrise::Kase

  def self.visible_to_everyone
    self.open.select { |p| p.visible_to == "Everyone" }
  end

end
