class Intercommunality < ApplicationRecord
  has_many :communes

  validates_presence_of :name, :siren 
  validates_uniqueness_of :siren, case_sensitive: false
  validates_format_of :siren, :with => /\A[0-9]{9}\Z/
  validates_inclusion_of :form, :in => %w(ca cu cc met)
end