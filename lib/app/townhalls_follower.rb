require 'twitter'
require 'twitter/search_results'
require 'json'
require 'dotenv'

Dotenv.load

class BotTwitter

	def perform

		initialize

	end

	def initialize


		@client = Twitter::REST::Client.new do |config|
 			config.consumer_key        = ENV["TWITTER_API_KEY"]
  			config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  			config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  			config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
		end

		    = JSON.parse(File.read("./db/townhalls.json"))

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



test = BotTwitter.new.perform

