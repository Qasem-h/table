class Betslip < ActiveRecord::Base
  has_many :games, dependent: :destroy

  accepts_nested_attributes_for :games

  monetize :winnings_cents, with_currency: :gbp
end
