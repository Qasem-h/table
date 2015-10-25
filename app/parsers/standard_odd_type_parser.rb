class StandardOddTypeParser
  include SAXMachine

  attribute :name
  element :bookmaker, class: BookmakerParser
end
