

class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    @@all << self
  end

  def self.create_from_collection(students_array)
    new_student = self.new
    students_array.each do |student|
      student.name = new_student.name
      student.location = new_student.location
      student.profile_url = new_student.profile_url
    end
  end

  def add_student_attributes(attributes_hash)

  end

  def self.all
    @@all
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
