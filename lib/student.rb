

class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |student|
      student_hash = {}
      student_hash[:name] = student[:name]
      student_hash[:location] = student[:location]
      student_hash[:profile_url] = student[:profile_url]
      new_student = Student.new(student_hash)
      new_student.name = student[:name]
      new_student.location = student[:location]
      new_student.profile_url = student[:profile_url]
      new_student
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
