class ImportJob < ApplicationJob
  def perform(file_path)
    Epcicom::Import::CsvFormatter.new(file_path).run
  end
end