require 'httparty'
require 'nokogiri'
require 'byebug'

class Scraper

    def self.scrape
    url3 = "https://www.worldometers.info/geography/flags-of-the-world/"
    unparsed_page = HTTParty.get(url3)
    parsed_page = Nokogiri::HTML(unparsed_page)
    country_info = parsed_page.css('div.col-md-4')
    #data for 195 countries
    country_array = []
        country_info.each do |country|
            if (!country.css('div a').attr('href').nil?)
                info = {
                    name: country.css('div div').text,
                    flag: country.css('div a').attr('href').value
                }
            country_array << info 
            end
        end
        byebug
        country_array
    end
    
end 