desc 'load livescores'

task load_livescores: :environment do
  LoadLivescore.run
end
