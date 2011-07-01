module CasesHelper

  def url_to_kase(kase_id)
    @current_site.url + '/kases/' + kase_id.to_s
  end

end
