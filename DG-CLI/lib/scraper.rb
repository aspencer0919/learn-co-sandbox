require 'open-uri'
require 'pry'

#scrapes course name, distance from entered zip code, and link to it's specific course page.
class Scraper
  def self.scrape_index()
    course_list = Nokogiri::HTML(open())
    
    courses = []
    
    course_list.css().each do |details|
      name = course_list.css().text
      location = course_list.css().value
      course_page = course_list.css().value
      course_info {
        :name => name,
        :location => location
        :course_page => course_page
      }
      courses << course_info
    end
    courses
  end
  
  #gets remaining variables from course detail page (course length, SSA)
  def self.scrape_course_page()
    course_details = Nokogiri::HTML(open())
    
    details = {}
    
    #container = 
  end
end