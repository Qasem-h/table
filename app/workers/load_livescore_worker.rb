class LoadLivescoreWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform
    LoadLivescore.run
  end
end
