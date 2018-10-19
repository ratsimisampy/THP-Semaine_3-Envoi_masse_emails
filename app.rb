=begin
EN ATTENTE :
#require './lib/app/townhalls_follower.rb'
#require './lib/app/townhalls_mailer.rb'
#require 'mime'
#include MIME
#require 'twitter'
#require 'twitter/search_results'

=end

require './lib/app/townhalls_scrapper.rb'
require 'json'
require './lib/views/done.rb'
require './lib/app/townhalls_adder_to_db.rb'
require './lib/views/index.rb'
require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'base64'
require 'json'
require 'dotenv'
Dotenv.load


class App

  def perform
  Done.new("./db/townhalls.json").perform
  Index.new.perform
  end

end

App.new.perform
