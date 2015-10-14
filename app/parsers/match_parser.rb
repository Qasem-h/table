class MatchParser
  include SAXMachine

  attribute :static_id, as: :id
  attribute :alternate_id_2, as: :alternate_id
  attribute :date do |date|
    date.to_date
  end
  attribute :time
  element :home, value: :name, as: :hometeam
  element :away, value: :name, as: :awayteam
  element :type, class: OddTypeParser, with: {
    name: '1x2'
  }
  ancestor :league do |league|
    league.name
  end
  ancestor :country do |league|
    league.country
  end

  def name
    "#{hometeam} vs #{awayteam}"
  end

  def time
    [@date, @time].join(' ')
  end

  def bookmaker
    type && type.bookmaker || NullBookmaker.new
  end

  def oddnameh
    bookmaker.odds.first.name
  end

  def oddwinh
    bookmaker.odds.first.value
  end

  def oddnamea
    bookmaker.odds.second.name
  end

  def oddwina
    bookmaker.odds.second.value
  end

  def oddnamed
    bookmaker.odds.third.name
  end

  def oddwind
    bookmaker.odds.third.value
  end
end
