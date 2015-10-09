class BookmakerParser
  include SAXMachine

  elements :odd, as: :odds, class: OddParser
end
