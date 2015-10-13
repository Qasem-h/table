class Betslip < ActiveRecord::Base
  has_many :games

  monetize :winnings_cents, with_currency: :gbp
end
