
require 'open-uri'
require 'nokogiri'
# require './db/townhalls.json'
# require 'json'



class TownhallsScrapper

	def perform
		get_all_the_urls_of_townhalls("hauts-de-seine")
		puts "**" * 10 
		get_all_the_urls_of_townhalls("seine-saint-denis")
		puts "**" * 10
		get_all_the_urls_of_townhalls("yvelines")
	end	



	# E-mails :
	def  get_the_email_of_a_townhal
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + "#{@mairie_url}" ))
		doc.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
	  		puts node.text
	  		dept_of_townhalls                            # Appel chercher la méthode des Departement
		end
	end


	# Names (and URL) :
	def  get_all_the_urls_of_townhalls(name_departement)
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + "#{name_departement}" + ".html"))
		doc.xpath('//a[@class = "lientxt"]').each do |link|
	  		@mairie_url =  link['href']                    # Récupère l'url des mairies 
	  		@mairie_name = link.text  
	  		puts @mairie_name                              # Affiche le nom des villes des mairies 
			get_the_email_of_a_townhal                     # Appel chercher la méthode des E-mails
	  	end
	end

	# Dept :
	def dept_of_townhalls
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + "#{@mairie_url}"))
		doc.xpath('/html/body/div[1]/main/section[4]/div/table/tbody/tr[1]/td[2]').each do |node|
			@mairie_dept = node.text
			puts @mairie_dept							# Affiche le département de chacune des mairies 
			handles_of_townhalls                            
		end
	end

	# Handles : 
	def handles_of_townhalls
		@mairie_handle = "@" + "#{@mairie_name.gsub(/[" "]/, "_")}"
		puts @mairie_handle
		puts "-" * 10
	end

end

test = Scrapper.new.perform





