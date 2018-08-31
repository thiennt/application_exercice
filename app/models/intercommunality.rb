class Intercommunality < ApplicationRecord
  has_many :communes

  validates_presence_of :name, :siren 
  validates_uniqueness_of :siren, case_sensitive: false
  validates_format_of :siren, :with => /\A[0-9]{9}\Z/
  validates_inclusion_of :form, :in => %w(ca cu cc met)

  before_save :update_slug

  def update_slug
    self.slug ||= self.name.parameterize
  end

  def communes_hash
    Hash[self.communes.collect { |commune| [commune.code_insee, commune.name] }]
  end
end