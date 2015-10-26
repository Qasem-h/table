class HandicapOddTypeParser
  include SAXMachine

  attribute :name
  element :bookmaker, class: HandicapBookmakerParser
end
