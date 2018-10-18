require 'open-uri'
require 'nokogiri'

class TownhallsScrapper

  def def_array(key)
    array_key = Array.new
    array_key.push(key)
  end

  def perform
    array_json = []
    array_json << perform_marguaux("hauts-de-seine")
    return array_json
  end

	def perform_marguaux(variable)
		get_all_the_urls_of_townhalls(variable)
		#get_all_the_urls_of_townhalls("seine-saint-denis")
		#get_all_the_urls_of_townhalls("yvelines")
	end	


	# E-mails :
	def  get_the_email_of_a_townhal
    email_array = []
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + "#{@mairie_url}" ))
		doc.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
##############################
	  		email_array << def_array(node.text)
	  		dept_of_townhalls                            # Appel chercher la méthode des Departement
		end
    return email_array
	end


	# Names (and URL) :
	def  get_all_the_urls_of_townhalls(name_departement)
    url_array = []
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + "#{name_departement}" + ".html"))
		doc.xpath('//a[@class = "lientxt"]').each do |link|
	  		@mairie_url =  link['href']                    # Récupère l'url des mairies 
	  		@mairie_name = link.text  
################################
	  		url_array << def_array(@mairie_name)                              # Affiche le nom des villes des mairies 
			get_the_email_of_a_townhal                     # Appel chercher la méthode des E-mails
	  	end
    return url_array
	end
	# Dept :
	def dept_of_townhalls
    departement_array = []
		doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/" + "#{@mairie_url}"))
		doc.xpath('/html/body/div[1]/main/section[4]/div/table/tbody/tr[1]/td[2]').each do |node|
			@mairie_dept = node.text
#################################
			departement_array << def_array(@mairie_dept)							# Affiche le département de chacune des mairies 
			handles_of_townhalls                            
		end
    return departement_array
	end

	# Handles : 
	def handles_of_townhalls
    handle_array = []
#################################
		@mairie_handle = "#{@mairie_name.gsub(/[" "]/, "_")}"
		handle_array << def_array(@mairie_handle)
	end
  #return handle_array
end

#TownhallsScrapper.new.perform
