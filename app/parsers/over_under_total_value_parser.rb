class OverUnderTotalValueParser
  include SAXMachine

  elements :odd, as: :odds, class: OddParser
end
