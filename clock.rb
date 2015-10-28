require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(30.minutes, 'import_leagues') { LoadAllLeaguesWorker.perform_async }
  every(15.minutes, 'import_livescores') { LoadLivescoreWorker.perform_async }
end
