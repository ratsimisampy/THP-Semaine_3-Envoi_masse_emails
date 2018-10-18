require 'open-uri'
require 'nokogiri'

# adresse mail des mairies selon département

class TownhallsScrapper

  def get_the_email_of_a_townhal_from_its_webpage(url_for_mail)
    hash_for_city = Hash.new
    doc = Nokogiri::HTML(open(url_for_mail))
    doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mail|
      mail = mail.text
      doc.xpath('/html/body/div/main/section[1]/div/div/div/h1').each do |city|
        city = city.text
        city = city.slice(0..-9)
        doc.xpath('/html/body/div[1]/main/section[4]/div/table/tbody/tr[1]/td[2]').each do |departement|
          departement = departement.text
          handle = city.gsub(/[" "]/, "_")
          handle = "@" + handle
            hash_for_city = {"city": city, "email": mail, "departement": departement, "handle": handle}
        end
      end
    end
    return hash_for_city
  end

  def get_all_the_urls_of_val_doise_townhalls(url_for_state)
    array_for_url = []
    doc = Nokogiri::HTML(open(url_for_state))
    doc.xpath('//a[@class = "lientxt"]').each do |link|
      url = 'http://annuaire-des-mairies.com/' + link['href']
      array_for_url << get_the_email_of_a_townhal_from_its_webpage(url)
    end
    return array_for_url
  end

  def perform
    get_all_the_urls_of_val_doise_townhalls('http://annuaire-des-mairies.com/hauts-de-seine.html')
    get_all_the_urls_of_val_doise_townhalls('http://annuaire-des-mairies.com/seine-saint-denis.html')
    get_all_the_urls_of_val_doise_townhalls('http://annuaire-des-mairies.com/yvelines.html')
  end
end

