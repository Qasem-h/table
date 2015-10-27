class LivescoreParser
  include SAXMachine

  elements :league, as: :leagues, class: LiveLeagueParser
end
