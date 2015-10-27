class StandardOddTypeParser
  include SAXMachine

  attribute :name
  element :bookmaker, class: StandardBookmakerParser

  def oddwinh
    bookmaker.odds.first.value
  end

  def oddwina
    bookmaker.odds.second.value
  end

  def oddwind
    bookmaker.odds.third.value
  end
end
