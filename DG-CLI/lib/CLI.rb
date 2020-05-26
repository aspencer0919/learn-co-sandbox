require_relative "../lib/calc.rb"
require_relative "../lib/scraper.rb"
require 'Nokogiri'

class CommandLineInterface
  BASE_PATH = "https://www.dgcoursereview.com/browse.php?cname=&designer=&coursetype%5B%5D=1&coursetype%5B%5D=2&holes=0&length_min=&length_max=&holetype=0&teetype=0&num_reviews=&rating_min=&rating_max=&yem=&yex=&cndtn=&terrain%5B%5D=1&terrain%5B%5D=2&terrain%5B%5D=3&landscape%5B%5D=1&landscape%5B%5D=2&landscape%5B%5D=3&mtees=&mpins=&cf=&private=1&paytoplay=1&country=1&city=&state=&zipcode="
  
  MODIFIED_BASE_PATH = BASE_PATH + "#{@zipcode}&zip_distance=#{@zip_distance}"
  
  def run
    make_courses
    add_attributes_to_courses
    display_courses
  end
  
  def make_courses
    course_array = Scraper.scrape_index_page(MODIFIED_BASE_PATH)
    
  end
  
  def add_attributes_to_courses
    
  end
  
  def display_courses
    
  end
  
end