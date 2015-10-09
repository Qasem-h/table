class OddTypeParser
  include SAXMachine

  element :bookmaker, class: BookmakerParser
end
