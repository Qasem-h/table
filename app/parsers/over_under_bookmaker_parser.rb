class OverUnderBookmakerParser
  include SAXMachine

  element :total, class: OverUnderTotalValueParser, with: {
    name: '2.5'
  }
end
