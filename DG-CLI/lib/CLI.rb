require_relative "../lib/calc.rb"
require_relative "../lib/courses.rb"
require_relative "../lib/scraper.rb"
require 'Nokogiri'

class CommandLineInterface
  
  attr_accessor :range
  
  BASE_PATH = "https://www.dgcoursereview.com/browse.php?cname=&designer=&coursetype%5B%5D=1&coursetype%5B%5D=2&holes=0&length_min=&length_max=&holetype=0&teetype=0&num_reviews=&rating_min=&rating_max=&yem=&yex=&cndtn=&terrain%5B%5D=1&terrain%5B%5D=2&terrain%5B%5D=3&landscape%5B%5D=1&landscape%5B%5D=2&landscape%5B%5D=3&mtees=&mpins=&cf=&private=1&paytoplay=1&country=1&city=&state=&zipcode="
  
  MODIFIED_BASE_PATH = BASE_PATH + "#{@zipcode}&zip_distance=#{@zip_distance}"
  
  def initialize
    @range = range
  end

  #gets zipcode input from user.
  def input(input)
    binding.pry
    puts "Welcome to the disc golf course finder. This tool will help you choose the best course around for you to go play! Start by entering your five digit zip code:"
    input = gets.strip
    if input.match(/([0-9] *){5}\b/)
      puts "Great!"
    else
      puts "Please enter a five digit zip code:"
      input
    end
  end
  
  #lets the user select mile range for search on web.
  def range
    puts "Now that we have your location, how many miles are you willing to drive? Please enter a milage from the following list (25, 50, 75, 100, 150, 200, 250, 300, any):"
    @range = gets.strip.to_i
    if @range.include?(25, 50, 75, 100, 150, 200, 250, 300, "any")
      puts "Thank you!"
    else
      puts "Please choose a value from the following list (25, 50, 75, 100, 150, 200, 250, 300, any):"
      @range
    end
  end

  #Gathers weighting for range
  def range_weighting(w1)
    if @range.include?(25, 50)
      w1 = 3
    elsif @range.include?(75, 100, 150)
      w1 = 2
    else
      w1 = 1
    end
  end
    
  #gathers weighting for length
  def length_weightings(w2)
    puts "Let's get the best course for you based on what you like in a course. How important is the length of the course to you? (high, medium, low)"
    input = gets.strip
    if input == "high"
      w2 = 3
    elsif input == "medium"
      w2 = 2
    elsif input == "low"
      w2 = 1
    else
      length_weightings
    end
  end
  
  #gathers weighting for difficulty
  def difficulty_weighting(w3)
    puts "And finally, how important is it for a course to be difficult vs. easy? (high, medium, low)"
    input = gets.strip
    if input == "high"
      w3 = 3
    elsif input == "medium"
      w3 = 2
    elsif input == "low"
      w3 = 1
    else
      length_weightings
    end
  end

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