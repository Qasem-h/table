class OddType < ActiveRecord::Base
  has_one :bookmaker
  belongs_to :match
end
