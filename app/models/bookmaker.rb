class Bookmaker < ActiveRecord::Base
  belongs_to :odd_type

  has_many :handicapes, dependent: :destroy
end
