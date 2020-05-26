class Courses
  attr_accessor :name, :location, :distance, :hole_count, :ssa, :weight_1, :weight_2, :weight_3, :aggregate
  
  @@all = []

	def initialize
  	@name = name
  	@location = location
  	@distance = distance
  	@hole_count = hole_count
  	@ssa = ssa
  	@weight_1 = weight_1
  	@weight_2 = weight_2
  	@weight_3 = weight_3
  	@aggregate = aggregate
	end
	
  def self.create_from_collection(course_array)
    course_array.each do |course_hash|
      Courses.new(course_hash)
    end
  end

  def add_course_attributes(attributes_hash)
    self.send("name=", attributes_hash[:name])
    self.send("location=", attributes_hash[:location])
    self.send("distance=", attributes_hash[:distance])
    self.send("hole count=", attributes_hash[:hole_count])
    self.send("length=", attributes_hash[:length])
    self.send("ssa=", attributes_hash[:ssa])
  end
  
  def self.all
    @@all
  end
end