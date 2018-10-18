#$:.unshift File.expand_path("./../lib", __FILE__)
=begin

mail_sender = TownhallsMailer.new
puts 'test'
mail_sender.send_mail
=end
require './lib/app/townhalls_scrapper.rb'
require 'json'
require './lib/app/townhalls_adder_to_db.rb'
require './lib/views/done.rb'
require './lib/views/index.rb'


Done.new("./db/townhalls.json").perform
Index.new.perform
