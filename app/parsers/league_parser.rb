class LeagueParser
  include SAXMachine

  attribute :country
  attribute :name
  elements :match, as: :matches, class: MatchParser
end
