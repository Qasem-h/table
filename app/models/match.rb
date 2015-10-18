class Match < ActiveRecord::Base
  has_many :odd_types, dependent: :destroy
  belongs_to :league

  accepts_nested_attributes_for :odd_types
end
