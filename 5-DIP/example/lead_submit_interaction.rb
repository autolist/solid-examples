class LeadSubmitInteraction
  class Failure < StandardError; end

  attr_accessor :leads_repo, :favorites_repo, :lead_submitter, :logger

  def initialize(leads_repo:, favorites_repo:, lead_submitter:, logger: Rails.logger)
    @leads_repo = leads_repo
    @favorites_repo = favorites_repo
    @lead_submitter = lead_submitter
    @logger = logger
  end

  def submit_lead(user, vehicle)
    lead = leads_repo.create(user, vehicle)
    raise_and_log('unable to create lead') unless lead

    favorite = favorites_repo.create(user, vehicle)
    raise_and_log('unable to favorite vehicle') unless favorite

    result = lead_submitter.submit(lead)
    raise_and_log('unable to submit lead') unless result

    logger.warn('lead submission success')
    result
  end

  def raise_and_log(message)
    logger.warn(message)
    raise(Failure.new(message))
  end
end

def get_lead_submit_interaction()
  LeadSubmitInteraction.new(
    leads_repo: FakeLeadRepo.new,
    favorites_repo: FakeFavoritesRepo.new,
    logger: instance_double(Logger)
  )
end