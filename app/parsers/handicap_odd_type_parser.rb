class HandicapOddTypeParser
  include SAXMachine

  attribute :name
  element :bookmaker, class: HandicapBookmakerParser

  def odds
    bookmaker.handicaps.collect(&:odds).flatten
  end
end
