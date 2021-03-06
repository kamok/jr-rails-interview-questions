# Caution: Make sure you keep in mind of case sensitivity when coding without a good text editor eg Google Docs.
# You have a list with these numbers in this order [ 1, 0, 5, 2, 10, 8, 12, -1 ]. 
# Create a Function that will return the minimum and the maximum values in the list. 
# Without .min, .max, or .sort
# { min: -1, max:12}

# def calc_max_min(array)
# 	min, max = array[0], array[0]
# 	array.each { |value| value <= min ? min = value : max = value }
#   {}.tap { |output| output[:min], output[:max] = min, max }
# end

# p calc_max_min([ 1, 0, 5, 2, 10, 8, 12, -1, -99, 516])

# Imagine our "%" is broken. Write a function that returns the remainder of division of the dividend by the divisor:
# remainder( 10, 3 ) = 1
# remainder( 12, 4 ) = 0
# Notice: I didn't finish this challenge on time, but the point is the logic behind it.

def remainder(dividend, divisor)
	remainder = dividend - divisor

	until remainder <= 0
		remainder -= divisor
	end	

	puts case 
		when remainder == 0 then 0
		when remainder < 0 then remainder + divisor
	end
end

remainder(12, 4)
remainder(10, 3)