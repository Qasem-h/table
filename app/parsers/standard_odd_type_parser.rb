class StandardOddTypeParser
  include SAXMachine

  attribute :name
  element :bookmaker, class: StandardBookmakerParser
end
