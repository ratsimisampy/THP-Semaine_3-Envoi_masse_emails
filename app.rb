=begin
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)

Done.new.perform
Index.new.perform
=end

#require 'bundler'
#Bundler.require
require './lib/app/townhalls_scrapper.rb'
require 'json'
#require 'TownhallsScrapper'

class TownhallsAdderToDb

  def save_into_json(hash)
    File.open("./db/townhalls.json", 'w') do |f|
      f.write(hash.to_json)
    end
    puts "JSON file saved"
  end

  def perform_add
    save_into_json(perform_scrapping)
  end
end

TownhallsAdderToDb.new.perform_add
