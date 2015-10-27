class OverUnderOddTypeParser
  include SAXMachine

  attribute :name
  element :bookmaker, class: OverUnderBookmakerParser

  def over
    bookmaker.total.over.value
  end

  def under
    bookmaker.total.under.value
  end
end
