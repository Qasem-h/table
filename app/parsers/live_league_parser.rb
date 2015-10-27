class LiveLeagueParser
  include SAXMachine

  elements :match, as: :matches, class: LiveMatchParser
end
