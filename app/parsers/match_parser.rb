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
  elements :type, as: :standard_types, class: StandardOddTypeParser, with: {
    name: /(1x2|Home\/Away|1x2 1st Half|Team To Score First|Team To Score Last)/
  }
  elements :type, as: :over_under_types, class: OverUnderOddTypeParser, with: {
    name: /(Over\/Under|Over\/Under 1st Half|Over\/Under 2nd Half)/
  }
  element :type, as: :handicap_type, class: HandicapOddTypeParser, with: {
    name: 'Handicap'
  }
  ancestor :league do |league|
    league.name
  end
  ancestor :country do |league|
    league.country
  end

  def odds_present?
    standard_types.present? || over_under_types.present? || handicape_type.present?
  end

  def name
    "#{hometeam} vs #{awayteam}"
  end

  def datetime
    Time.parse([@date, @time].join(' '))
  end
end
