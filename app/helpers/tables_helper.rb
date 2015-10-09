module TablesHelper
  module_function

  def parse
    f = File.open("public/odds/england.xml")
    odds_feed = OddsFeedParser.parse(f)
    odds_feed.matches.select { |match| match.type.present? }
  end
end
