class OverUnderTotalValueParser
  include SAXMachine

  element :odd, as: :under, class: OddParser, with: {
    name: 'Under'
  }
  element :odd, as: :over, class: OddParser, with: {
    name: 'Over'
  }
end
