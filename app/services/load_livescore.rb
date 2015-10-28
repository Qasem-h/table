require 'open-uri'

class LoadLivescore
  def self.run
    new.run
  end

  def run
    livescore.matches.each { |match_parser| update_scores(match_parser) }
  end

  private

  def update_scores(match_parser)
    match = Match.find_by(alternate_id: match_parser.alternate_id_2)
    return unless match
    score = match.score || match.build_score
    score.update(match_parser.params)
  end

  def livescore
    LivescoreParser.parse(remote_file) 
  end

  def remote_file
    @remote_file ||= open(url)
  end

  def url
    'http://www.tipgin.net/datav2/accounts/monsoonm/soccer/livescore/livescore.xml'
  end
end
