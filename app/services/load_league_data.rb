require 'open-uri'

class LoadLeagueData
  attr_reader :league

  def initialize(league)
    @league = league
  end

  def run
    odds_feed.leagues.each do |league_parser|
      league = League.find_or_create_by(country: league_parser.country, name: league_parser.name)
      update_matches(league_parser, league)
    end
  end

  private

  def update_matches(league_parser, league)
    league_parser.matches.select { |match| match.type.present? }.each { |match_parser| update_match(match_parser, league) }
  end

  def update_match(match_parser, league)
    match = Match.find_or_initialize_by(static_id: match_parser.id)
    match.league = league
    match.odd_types.destroy_all
    match.update(match_params(match_parser))
  end

  def match_params(match_parser)
    {
      alternate_id: match_parser.alternate_id,
      play_date: match_parser.datetime,
      hometeam: match_parser.hometeam,
      awayteam: match_parser.awayteam,
      odd_types_attributes: odd_types_attributes(match_parser)
    }
  end

  def odd_types_attributes(match_parser)
    [{ name: '1x2', bookmaker_attributes: { home_win: match_parser.oddwinh, away_win: match_parser.oddwina, draw: match_parser.oddwind }}]
  end

  def remote_file
    open("http://www.tipgin.net/datav2/accounts/cmonsoon/soccer/odds/#{league}.xml")
  end

  def odds_feed
    @odds_feed ||= OddsFeedParser.parse(remote_file)
  end
end
