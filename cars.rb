class Car
	@@total_car_count = 0
	@@cars_per_color = {}

	#Self refers to the class in this case...
	#@@total_car_count is a class variable
	def self.total_car_count
		@@total_car_count 
	end
	
	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end


	#Each time a new instance of car is created, the class variable @@total_car_count
	#increases by one.
	#Each car has a 10 unit tank and starts with 0.
	def initialize(color, convertible)
		@@total_car_count += 1
		@fuel = 10
		@distance = 0
		@color = color
		@convertible = true
		if @@cars_per_color[color]
			@@cars_per_color[color] += 1
		else
			@@cars_per_color[color] = 1
		end
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end

	def self.most_popular_color
		best_color = @@cars_per_color.max_by{|k,v| v}
		puts best_color[0]
	end
	

end

car_a= Car.new("red") 
car_c= Car.new("red") 
car_b = Car.new("blue")
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b
Car.most_popular_color




#Class methods are used only on the class
#Instance methods are used on on instances
#Instance variables can be accessed only in instance methods
#Class variables can be accessed anywhere

# puts Car.total_car_count
# c1 = Car.new
# puts Car.total_car_count
# c2 = Car.new
# puts Car.total_car_count

# # 1 - Class method on instance
# # Class methods can only be used on the class.
# c = Car.new
# c.total_car_count

# 2 - Class method on class... this one works.
# Car.total_car_count
# puts Car.total_car_count

# # 3 - Instance method on class... 
# # this one doesn't work because instance methods only work on instances
# Car.drive(10)

# # 4 - Instance method on instance... this one works.
# c = Car.new
# puts "Added a new car!"
# c.drive(10)
# puts "Driving!"


# hash = { :color => "red", :shape => "circle", green: 42 }
# puts hash[:shape]
# hash[:color]="blue"
# puts hash
# hash[:hair]="brown"
# puts hash
# puts hash[:green]









