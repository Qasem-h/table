class LivescoreParser
  include SAXMachine

  elements :league, as: :leagues, class: LiveLeagueParser

  def matches
    leagues.collect(&:matches).flatten.compact
  end
end
