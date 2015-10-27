class HandicapParser
  include SAXMachine

  attribute :name
  elements :odd, as: :odds, class: HandicapOddParser
end
