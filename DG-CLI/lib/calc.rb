class Calc
	attr_accessor :name, :location, :distance, :ssa, :weight_1, :weight_2, :weight_3, :aggregate
	@@list = []

	def initialize
		@name = name
		@location = location
		@distance = distance
		@ssa = ssa
		@weight_1 = weight_1
		@weight_2 = weight_2
		@weight_3 = weight_3
		@aggregate = aggregate
	end
	
	#calculates course score
	def calc(score_1, score_2, score_3)
	  score_1 = 0
	  score_2 = 0
	  score_3 = 0
	  
	  score_1 = self.location * @weight_1
	  score_2 = self.distance * @weight_2
	  score_3 = self.ssa * @weight_3
	  @aggregate = score_1 + score_2 + score_3
  end
	
	#sorts courses based on score
	
	#returns top five courses based on score
	
end