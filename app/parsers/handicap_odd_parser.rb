class HandicapOddParser
  include SAXMachine

  attribute :name
  attribute :value

  ancestor :handicape do |handicape|
    handicape.name
  end
end
