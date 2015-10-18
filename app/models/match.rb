class Match < ActiveRecord::Base
  has_many :odd_types, dependent: :destroy
  belongs_to :league
end
