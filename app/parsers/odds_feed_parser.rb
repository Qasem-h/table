class OddsFeedParser
  include SAXMachine

  elements :league, as: :leagues, class: LeagueParser

  def matches
    leagues.collect(&:matches).flatten
  end
end
