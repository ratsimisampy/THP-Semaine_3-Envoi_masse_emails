require 'open-uri'
require 'nokogiri'

# adresse mail des mairies selon département

class TownhallsScrapper

  def def_hash(city, mail, departement, handle)
    hash_def = Hash.new
    name = name
    hash_def = {"city": city.join, "email": mail.join, "departement": departement.join, "handle": handle.join}
    return hash_def
  end

  def array(city, mail, departement, handle)
    array_city = []
    array_mail = []
    array_departement = []
    array_handle = []
    array_city.push(city)
    array_mail.push(mail)
    array_departement.push(departement)
    array_handle.push(handle)
    return def_hash(array_city, array_mail, array_departement, array_handle)
  end

  def get_the_email_of_a_townhal_from_its_webpage(url_for_mail)
    array_for_city = []
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
          array_for_city << array(city, mail, departement, handle)
        end
      end
    end
    return array_for_city.join
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

