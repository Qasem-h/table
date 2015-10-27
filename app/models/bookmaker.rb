class Bookmaker < ActiveRecord::Base
  has_many :handicapes, dependent: :destroy
  has_many :over_under_total_values, dependent: :destroy
  belongs_to :odd_type

  accepts_nested_attributes_for :handicapes
  accepts_nested_attributes_for :over_under_total_values
end
