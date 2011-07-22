class Recording < Highrise::Recording

  def case_id
    collection_id if collection_id && collection_type == "Kase"
  end

end
