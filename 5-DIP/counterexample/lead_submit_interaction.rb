class LeadSubmitInteraction
  class Failure < StandardError; end

  def submit_lead(user, vehicle)
    leads_repo = DbLeadsRepo.new(url: ENV['DATABASE_URL'])
    favorites_repo = RedisFavoritesRepo.new(url: ENV['REDIS_URL'])
    lead_submitter = EmailLeadSubmitter.new

    lead = leads_repo.create(user, vehicle)
    raise_and_log('unable to create lead') unless lead

    favorite = favorites_repo.create(user, vehicle)
    raise_and_log('unable to favorite vehicle') unless favorite

    result = lead_submitter.submit(lead)
    raise_and_log('unable to submit lead') unless result

    Rails.logger('lead submission success')
    result
  end

  def raise_and_log(message)
    Rails.logger.warn(message)
    raise(Failure.new(message))
  end
end