# Implement an algorithm to determine if a string has all unique characters. 
# What if you can not use additional data structures?

# My solution is pretty much the same for both. 

def unique_char2?(string)
  string.chars.each_with_index do |char, index|
    string.chars.each_with_index do |char2, index2|
      next if index == index2
      return false if char == char2
    end
  end
  true
end

p unique_char2?("kneegrow")

def unique_char?(string)
  length = string.size
  length.times do |i|
    length.times do |i2|
      next if i == i2
      return false if string[i] == string[i2]
    end
  end
  true
end

p unique_char?("kneegrow")

# I've seen this one... but it's probably not accceptable in an interview lol

def unique_char_cheater?(string)
  return false if string.split("").uniq.size != string.size
  true
end

p unique_char_cheater?("kneegrow")