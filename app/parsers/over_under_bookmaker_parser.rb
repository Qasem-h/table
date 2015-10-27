class OverUnderBookmakerParser
  include SAXMachine

  elements :total, as: :totals, class: OverUnderTotalValueParser
end
