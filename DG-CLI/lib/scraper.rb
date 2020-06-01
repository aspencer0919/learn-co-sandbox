require 'open-uri'
require 'pry'

class Scraper
  
  #scrapes course name, and link to it's specific course page.
  def self.scrape_index()
    course_list = Nokogiri::HTML(open())
    
    courses = []
    
    course_list.css().each do |details|
      name = course_list.css(//*[@id="content_large"]/table/tbody/tr[2]/td[1]/a).text
      location = course_list.css(//*[@id="content_large"]/table/tbody/tr[2]/td[2]).text
      distance = course_list.css(//*[@id="content_large"]/table/tbody/tr[2]/td[3]).text
      hole_count = course_list.css(//*[@id="content_large"]/table/tbody/tr[2]/td[4]).value
      course_page = course_list.css(//*[@id="content_large"]/table/tbody/tr[2]/td[1]/a).value
      course_info {
        :name => name,
        :location => location
        :distance => distance
        :hole_count => hole_count
        :course_page => course_page
      }
      courses << course_info
    end
    courses
  end
  
  #gets remaining variables from course detail page (course length, SSE, par)
  def self.scrape_course_page()
    course_details = Nokogiri::HTML(open(@course_page))
    
    details = {}
    
    course_details.css().each do |values|
      course_length = course_details.css(//*[@id="crse_length"]).text
      course_sse = course_details.css(//*[@id="content_infobar"]/span[7]/text()[2]).text.to_i
      course_par = course_details.css(//*[@id="content_infobar"]/span[6]/text()[2]).text.to_i
    end
  end
end