class StandardOddTypeParser
  include SAXMachine

  attribute :name
  element :bookmaker, class: StandardBookmakerParser

  def bookmaker
    @bookmaker || NullBookmaker.new
  end

  def oddwinh
    bookmaker.odds.first.value
  end

  def oddwina
    bookmaker.odds.second.value
  end

  def oddwind
    third_odd.value
  end

  def third_odd
    bookmaker.odds.third || NullOdd.new
  end
end
