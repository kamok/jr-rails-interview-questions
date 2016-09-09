##Write a method that takes in an array and a value.
##Return two values in the array that can sum to the given value. 
# Assume the array is sorted

a = [1,2,3,4,5,6,7,8,9,10]

def can_build_sum?(array, target_sum)
	min = array[0]
	max = array[-1]

	array.each do |first_num|
		second_num = target_sum - first_num
		next if second_num < min || second_num > max

		return true if array.bsearch { |x| x == second_num }
	end
	return false
end

p can_build_sum?(a, 55)