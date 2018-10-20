require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    profile_array = []
    doc = Nokogiri::HTML(open(index_url))
      doc.css(".student-card").each do |card|
        profile = Hash.new
        profile[:name] = card.css(".student-name").text
        profile[:location] = card.css(".student-location").text
        profile[:profile_url] = card.css("a")[0]["href"]
        profile_array << profile
      end
      profile_array
    end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    profile_hash = {}
      doc.css(".social-icon-container").each do |social|
        profile_hash[:twitter] = social.css("a")[0]["href"]
        profile_hash[:linkedin] = social.css("a")[1]["href"]
        profile_hash[:github] = social.css("a")[2]["href"]
        profile_hash[:blog] = social.css("a")[3]["href"]
      end
      doc.css(".profile-quote").each do |quote|
        profile_hash[:profile_quote] = quote.text
      end
      doc.css(".description-holder p").each do |p|
        profile_hash[:bio] = p.text
      end
      profile_hash
    end

end


#
# Scraper.scrape_profile_page(profile_url)
# # => {:twitter=>"http://twitter.com/flatironschool",
#       :linkedin=>"https://www.linkedin.com/in/flatironschool",
#       :github=>"https://github.com/learn-co,
#       :blog=>"http://flatironschool.com",
#       :profile_quote=>"\"Forget safety. Live where you fear to live. Destroy your reputation. Be notorious.\" - Rumi",
#       :bio=> "I'm a school"
#      }
