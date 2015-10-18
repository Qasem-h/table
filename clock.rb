require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(30.minutes, 'import_leagues') { LoadAllLeaguesWorker.perform_async }
end
