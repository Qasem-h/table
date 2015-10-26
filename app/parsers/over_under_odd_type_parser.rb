class OverUnderOddTypeParser
  include SAXMachine

  attribute :name
  element :bookmaker, class: OverUnderBookmakerParser
end
