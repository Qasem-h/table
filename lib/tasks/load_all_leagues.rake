desc 'load bets for all leagues'

task load_all_leagues: :environment do
  LoadAllLeagues.run
end
