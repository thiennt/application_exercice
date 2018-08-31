module CommuneConcerns
  extend ActiveSupport::Concern

  included do
    default_scope { order(:code_insee) }
  end

  class_methods do
    def search(search_str)
      search_str = Commune.send(:sanitize_sql_like, search_str.downcase)
      self.where(["LOWER(name) LIKE ?", "%#{search_str}%"])
    end

    def to_hash
      Hash[self.all.collect { |commune| [commune.code_insee, commune.name] }]
    end
  end
end