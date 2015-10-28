class Match < ActiveRecord::Base
  has_many :odd_types, dependent: :destroy
  has_one :score, dependent: :destroy
  belongs_to :league

  accepts_nested_attributes_for :odd_types

  def name
    "#{hometeam} vs #{awayteam}"
  end

  def bookmaker
    odd_types.first.bookmaker
  end

  def oddwinh
    bookmaker.home_win
  end

  def oddwina
    bookmaker.away_win
  end

  def oddwind
    bookmaker.draw
  end
end
