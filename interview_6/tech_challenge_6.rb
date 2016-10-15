## Done via https://www.interviewzen.com/. Pretty cool method

## Problem goes was timed and screen casted. No limit, but if you take too long you look dumb. Took me 9 minutes. 

## Given a string like this... "1,3-5,8,9"
## Expect to return an array of string like this ... ["1","3","4","5","8","9"]

def parse_to_array(string)
	clues = string.split(",")
	final_return = []
  clues.each do |clue|
		if clue.include?("-") == false
			final_return << clue
		else
			range = clue.split("-")	
			min,max = range[0].to_i, range[-1].to_i
			final_return << (min..max).to_a.map(&:to_s)
		end
  end
  final_return.flatten
end
		

p parse_to_array("1,3-5,8,9")