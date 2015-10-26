class HandicapBookmakerParser
  include SAXMachine

  attribute :name
  elements :odd, as: :odds, class: OddParser
end
