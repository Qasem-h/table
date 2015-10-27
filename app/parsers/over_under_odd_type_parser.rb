class OverUnderOddTypeParser
  include SAXMachine

  attribute :name
  element :bookmaker, class: OverUnderBookmakerParser

  def bookmaker
    @bookmaker || NullBookmaker.new
  end
end
