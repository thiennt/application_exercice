class Street < ApplicationRecord
  has_many :commune_streets
  has_many :communes, through: :commune_streets

  validates_presence_of :title
  validates_numericality_of :from, :to, :allow_nil => true
  validates_numericality_of :to, :greater_than => :from, :if => Proc.new {|street| street.from.present? }
end