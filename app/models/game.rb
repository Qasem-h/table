class Game < ActiveRecord::Base
  belongs_to :betslip

  monetize :stake_cents, with_currency: :gbp
end
