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
    league_parser.matches.each { |match_parser| update_match(match_parser, league) if match_parser.odds_present? }
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
    [].tap do |attributes|
      match_parser.standard_types.each do |type_parser|
        if type_parser.oddwina && type_parser.oddwinh
          attributes << { name: type_parser.name, bookmaker_attributes: { home_win: type_parser.oddwinh, away_win: type_parser.oddwina, draw: type_parser.oddwind }}
        end
      end

      match_parser.over_under_types.each do |type_parser|
        attributes << { name: type_parser.name, bookmaker_attributes: { over_under_total_values_attributes: over_under_total_values(type_parser) }}
      end

      handicape_type = match_parser.handicape_type
      attributes << { name: handicape_type.name, bookmaker_attributes: { handicapes_attributes: handicapes(handicape_type) } } if handicape_type
    end
  end

  def over_under_total_values(type_parser)
    type_parser.bookmaker.totals.map do |total|
      { name: total.name, under: total.under.value, over: total.over.value } if total.under && total.over
    end.compact
  end

  def handicapes(handicape_type)
    handicape_type.odds.map do |odd|
      { name: odd.handicape, value: odd.value, handicape_type: odd.name }
    end
  end

  def remote_file
    open("http://www.tipgin.net/datav2/accounts/cmonsoon/soccer/odds/#{league}.xml")
  end

  def odds_feed
    @odds_feed ||= OddsFeedParser.parse(remote_file)
  end
end
