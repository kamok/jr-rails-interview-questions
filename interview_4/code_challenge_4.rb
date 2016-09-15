##This interview was a follow up to interview_3. Asked over Google Hangout and done over a MSFT word doc.

# Q1: Word Score
# Given that A = 1, B = 2, C = 3...case not sensitive
# Write a function that you input a word (string), and you get a word score
# Two more rules:
# If repeating, exponetation the number of times a letter appears
# Eg. BAFFLE, First F counts as 6. Second F counts as 6**2 (36)
# Also factor in the index of the letter by multipying the index, counting from 1
# Eg. the word ABA will yield = 1*1 + 2*2 + 1**2*3 

DICTIONARY = { a=>1, b=>2 }
Word = baffle
[“b”,”a”...]

def word_score(word)
	words_already_checked = {}
	word_array = word.split(“”)

	word_array.map! do |letter|
		words_already_checked[letter] = 0

		if words_already_checked[letter] > 0
			letter = DICTIONARY[letter] ** (words_already_checked[letter] + 1)
		else
			letter = DICTIONARY[letter]
		end
			words_already_checked[letter] += 1 
	end

	final_word = []

	word_array.each_with_index |letter, index|
		index = index + 1
		final_word << letter * index 
	end 
	##[2,6,65,1656]  add up all the numbers in the array to get the sum
	final_word.inject(&:+)
end


# Q2: In english, numbers 1-5 are represented as: “One, two, three, four, five”. 
# If you count the chars (without the commas, hypens, or spaces), it sums to 19.

# Now write an alogirthm to count characters in the english version of numbers 1-1000.
# Assume an Integer.to_string function

(1..1000).to_a.map {|num| num.to_string.count}.inject(&:+)

# They then asked me to refactor it to make it faster which I tried but couldn't do.
# numbers = (1..1000).to_a.

# teenagers = { “fifteen” => 7, “fourteen”....}

# Singles = { “one” => 3, “two” => 3 }

# Suffix =  { “hundred” => 7, “thousand” => 8}



## Q3: Poker 

# 5H 5C QS JH 7S = 5 hearts, 5 clubs, Queen Spades Jack hearts, 7 spades = Two 5s//One Pair

# 5H 5C QS JH 7S 2C 3S 8S 8D TD 
# Player One vs. Player Two in One Hand = Player One has one Pair of 5s, Player Two has one Pair of 8s. 
# Player Two wins

# You are given 1000 hands in a text file. Calculate how many times Player 1 wins.


# High Card: Highest value card.
# One Pair: Two cards of the same value.
# Two Pairs: Two different pairs.
# Three of a Kind: Three cards of the same value.
# Straight: All cards are consecutive values.
# Flush: All cards of the same suit.
# Full House: Three of a kind and a pair.
# Four of a Kind: Four cards of the same value.
# Straight Flush: All cards are consecutive values of same suit.
# Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

Def ryoyal_flush?
End

Def find_highest(hand)
	royal_flush?(hand)
	Straight_Flush?(hand)
end


For each line in txt…
	First divide the string in half. Player 1 = first half, Player 2 is next half.
	Then, we have to evaluate the highest value that can be derived from each hand. We will start with the highest value one, the royal flush. 
Now that we know what “combination” each player has, use a word score tactic to find the one who wis.
Player 1 = “Full House 5” 
Player 2 = “Full House 4”

Combinations = {“Full House” => } 
Suit = { Spade => “4”}
	

Order of hands in poker
