class Randomize

	def generate_random_date from = Time.now, to = Time.new(2018, 11, 17)
  	from + rand * (to.to_f - from.to_f)
	end
end