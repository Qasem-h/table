class OverUnderOddTypeParser
  include SAXMachine

  attribute :name
  element :bookmaker, class: OverUnderBookmakerParser

  def over
    total.over && total.over.value
  end

  def under
    total.under && total.under.value
  end

  def total
    bookmaker.total || NullTotal.new
  end
end
