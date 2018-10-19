=begin
GEM UTILISÉE:
require 'twitter'
require 'twitter/search_results'
require 'json'
require 'dotenv'

Dotenv.load
=end

class TownhallsFollower
  attr_accessor :file_db

  def initialize(file_db)
    @file_db = file_db
  end

	def perform

		initialize_bot

	end

	def initialize_bot


		@client = Twitter::REST::Client.new do |config|
 			config.consumer_key        = ENV["TWITTER_API_KEY"]
  			config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  			config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  			config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
		end

		    = JSON.parse(File.read(@file_db))

		 search_handle
		# follow_handle
	end

	def search_handle
		# journalistes = ["@Montrouge"]
		    .each do |handle| 
		    @temp = @client.user_search(handle)[0]
			puts @temp.screen_name  
			follow_handle
		end
	end
	
	def follow_handle
		@client.follow (@temp)	
	end
end	

