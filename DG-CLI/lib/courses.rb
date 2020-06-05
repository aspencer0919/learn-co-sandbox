class Courses
  attr_accessor :name, :location, :distance, :hole_count, :length, :sse, :par
  
  @@all = []

	def initialize(course_hash)
    self.send("name=", course_hash[:name])
    self.send("location=", course_hash[:location])
    self.send("distance=", course_hash[:distance])
    self.send("hole count=", course_hash[:hole_count])
    self.send("course_page=", course_hash[:course_page])
	end
	
  def self.create_from_collection(course_array)
    course_array.each do |course_hash|
      Courses.new(course_hash)
    end
  end

  def add_course_attributes(attributes_hash)
    self.send("length=", attributes_hash[:length])
    self.send("sse=", attributes_hash[:sse])
    self.send("par=", attributes_hash[:par])
  end
  
  def self.all
    @@all
  end
end