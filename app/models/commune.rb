class Commune < ApplicationRecord
  belongs_to :intercommunality
  has_many :commune_streets
  has_many :streets, through: :commune_streets

  validates_presence_of :name, :code_insee
  validates_format_of :code_insee, :with => /\A[0-9]{5}\Z/
end