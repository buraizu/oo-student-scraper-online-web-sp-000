

class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    @name = student_hash[:name]
    @location = student_hash[:location]
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |student|
      self.new(student)
    end
  end

end

# Scraper.scrape_index_page(index_url)
# # => [
#         {:name => "Abby Smith", :location => "Brooklyn, NY", :profile_url => "students/abby-smith.html"},
#         {:name => "Joe Jones", :location => "Paris, France", :profile_url => "students/joe-jonas.html"},
#         {:name => "Carlos Rodriguez", :location => "New York, NY", :profile_url => "students/carlos-rodriguez.html"},
#         {:name => "Lorenzo Oro", :location => "Los Angeles, CA", :profile_url => "students/lorenzo-oro.html"},
#         {:name => "Marisa Royer", :location => "Tampa, FL", :profile_url => "students/marisa-royer.html"}
#       ]
