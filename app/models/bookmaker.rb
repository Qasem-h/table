class Bookmaker < ActiveRecord::Base
  has_many :handicapes, dependent: :destroy
  belongs_to :odd_type

  accepts_nested_attributes_for :handicapes
end
