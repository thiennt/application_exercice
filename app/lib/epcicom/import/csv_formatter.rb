module Epcicom
  module Import
    class CsvFormatter
      attr_accessor :file_path

      def initialize(file_path)
        @file_path = file_path
      end

      def run
        ::CSV.foreach(file_path, headers: true, encoding:'iso-8859-1:utf-8', col_sep: ';') do |row|
          row = row.to_h
          incom = Intercommunality.find_or_initialize_by(id: row["dep_epci"])
          
          if incom.update(map_row_to_incom_hash(row))
            commune = Commune.find_or_initialize_by(code_insee: row["insee"])
            commune.update(map_row_to_commune_hash(row))
          end
        end
      end

      private

      def map_row_to_incom_hash(row)
        {
          name: row["nom_complet"],
          siren: row["siren_epci"],
          form: row["form_epci"].downcase.first(3),
        }
      end

      def map_row_to_commune_hash(row)
        {
          name: row["nom_com"],
          intercommunality_id: row["dep_com"],
          population: row["pop_total"]
        }
      end
    end
  end
end