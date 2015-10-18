class OddType < ActiveRecord::Base
  has_one :bookmaker, dependent: :destroy
  belongs_to :match

  accepts_nested_attributes_for :bookmaker
end
