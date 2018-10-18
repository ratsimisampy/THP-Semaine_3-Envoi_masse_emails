=begin
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)

Done.new.perform
Index.new.perform


mail_sender = TownhallsMailer.new
puts 'test'
mail_sender.send_mail

=end
require './lib/app/townhalls_scrapper.rb'
require 'json'
require './lib/app/townhalls_adder_to_db.rb'

TownhallsAdderToDb.new("./db/townhalls.json").perform
