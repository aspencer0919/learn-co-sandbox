require_relative "../lib/calc.rb"
require_relative "../lib/courses.rb"
require_relative "../lib/scraper.rb"
require 'nokogiri'

class CommandLineInterface
  
  attr_accessor :zip, :range, :weight_1, :weight_2, :weight_3
  
  source = "https://www.dgcoursereview.com/browse.php?cname=&designer=&coursetype%5B%5D=1&coursetype%5B%5D=2&holes=0&length_min=&length_max=&holetype=0&teetype=0&num_reviews=&rating_min=&rating_max=&yem=&yex=&cndtn=&terrain%5B%5D=1&terrain%5B%5D=2&terrain%5B%5D=3&landscape%5B%5D=1&landscape%5B%5D=2&landscape%5B%5D=3&mtees=&mpins=&cf=&private=1&paytoplay=1&country=1&city=&state=&zipcode="
  
  BASE_PATH = source + "#{@zip}&zip_distance=#{@range}"
  
  def initialize
    @zip = zip
    @range = range
    @weight_1 = weight_1
    @weight_2 = weight_2
    @weight_3 = weight_3
  end
  
  def run
    zip
    range
    range_weighting
    length_weighting
    difficulty_weighting
  end
  
  def display
    make_courses
    add_attributes_to_courses
    display_courses
  end

  #gets zipcode input from user.
  def zip
    puts "Welcome to the disc golf course finder. This tool will help you choose the best course around for you to go play! Start by entering your five digit zip code:"    
    ui = gets.strip.to_i
    if ui.match(/([0-9] *){5}\b/)
      puts "Great!"
      @zip = ui
    else
      puts "Please enter a five digit zip code:"
      zip
    end
  end

  
  #lets the user select mile range for search on web.
  def range
      puts "Now that we have your location, how many miles are you willing to drive? Please enter a milage from the following list (25, 50, 75, 100, 150, 200, 250, 300, any:"
    @range = gets.strip
    if @range.include?(25, 50, 75, 100, 150, 200, 250, 300, "any")
      puts "Thank you!"
    else
      puts "Please choose a value from the following list (25, 50, 75, 100, 150, 200, 250, 300, any):"
      @range
    end
  end

  #Gathers weighting for range
  def range_weighting
    if @range.include?(25, 50)
      @weight_1 = 3
    elsif @range.include?(75, 100, 150)
      @weight_1 = 2
    else
      @weight_1 = 1
    end
  end
    
  #gathers weighting for length
  def length_weighting
    puts "Let's get the best course for you based on what you like in a course. How important is the length of the course to you? (high, medium, low)"
    input = gets.strip
    if input == "high"
      @weight_2 = 3
    elsif input == "medium"
      @weight_2 = 2
    elsif input == "low"
      @weight_2 = 1
    else
      length_weightings
    end
  end
  
  #gathers weighting for difficulty
  def difficulty_weighting(w3)
    puts "And finally, how important is it for a course to be difficult vs. easy? (high, medium, low)"
    input = gets.strip
    if input == "high"
      @weight_3 = 3
    elsif input == "medium"
      @weight_3 = 2
    elsif input == "low"
      @weight_3 = 1
    else
      length_weightings
    end
  end

 # def run
#   make_courses
#   add_attributes_to_courses
#   display_courses
#  end
  
  def make_courses
    course_array = Scraper.scrape_index_page(MODIFIED_BASE_PATH)
    Courses.create_from_collection(course_array)
  end
  
  def add_attributes_to_courses
    Courses.all.each do |course|
      attributes = Scraper.scrape_course_page(courses.course_page)
      Courses.add_course_attributes(attributes)
    end
  end
  
  def display_courses
    
  end
end

