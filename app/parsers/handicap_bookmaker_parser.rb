class HandicapBookmakerParser
  include SAXMachine

  elements :handicap, as: :handicaps, class: HandicapParser
end
