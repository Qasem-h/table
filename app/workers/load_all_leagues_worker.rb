class LoadAllLeaguesWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform
    LoadAllLeagues.run
  end
end
