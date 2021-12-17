class AnalyticsProvider
  # user -> vehicle interactions
  def srp_impression(user, vehicle, position); end
  def vdp_impression(user, vehicle); end
  def srp_lead(user, vehicle); end
  def vdp_lead(user, vehicle); end
  def srp_hover(user, vehicle); end
  def srp_expand(user, vehicle); end
  def vdp_dwell(user, vehicle); end
  def vdp_scroll(user, vehicle); end
  def vdp_section_expand(user, vehicle); end
  def report_vehicle(user, vehicle, reason); end
  def favorite_vehicle(user, vehicle, reason); end
  def unfavorite_vehicle(user, vehicle, reason); end

  # other interactions
  def page_view(user, url); end
  def search(user, params); end
  def param_selected(user, param, value); end
  def no_results(user, params); end
  def site_dwell(user, time); end

  # user management
  def name_updated(user, new_name); end
  def phone_updated(user, new_phone); end
  def email_updated(user, new_email); end

  # saved searches
  def saved_search_created(user, params, id); end
  def saved_search_updated(user, params, id); end
  def saved_search_deleted(user, id); end
  def saved_search_results_viewed(user, id); end
end