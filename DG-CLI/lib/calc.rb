class Calc
	attr_accessor :name, :location, :distance, :length, :par, :sse, :difficulty, :weight_1, :weight_2, :weight_3, :aggregate
	@@list = []

	def initialize
		@name = name
		@location = location
		@distance = distance
		@length = length
		@par = par
		@sse = sse
		@difficulty = difficulty
		@weight_1 = weight_1
		@weight_2 = weight_2
		@weight_3 = weight_3
		@aggregate = aggregate
	end
	
	#calculates difficulty of course with sse relitive to par.
	def difficulty
	  @difficulty = @sse / @par
  end
	
	#calculates course score based on criteria weightings.
	def calc(score_1, score_2, score_3)
	  self.each do |math|
	    score_1 = self.distance * @weight_1
  	  score_2 = self.length * @weight_2
  	  score_3 = self.difficulty * @weight_3
  	  @aggregate = score_1 + score_2 + score_3
  	end
  end
	
	#sorts courses based on score
	def best_courses
	  Coursess.sort_by {|score| courses.aggregate}
  end
	
	#returns top five courses based on score
	def display_courses
	  counter = 0
	  while counter < 5
	  puts "#{@name} - #{@location} (#{@distance})"
	  puts "#{@length} - par: #{@par}"
	  counter += 1
    end
	end
end