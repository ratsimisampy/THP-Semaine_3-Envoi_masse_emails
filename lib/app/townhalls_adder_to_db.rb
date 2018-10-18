class TownhallsAdderToDb < TownhallsScrapper
  attr_accessor :file

  def initialize(file)
    @file = file
  end

  def save_into_json(hash)
    File.open(@file, 'w') do |f|
      f.write(hash.to_json)
    end
    puts 'JSON file saved'
  end

  def perform
    save_into_json(TownhallsScrapper.new.perform)
  end
end
