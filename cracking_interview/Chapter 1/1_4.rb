# Write a method to decide if two strings are anagrams or not.

def anagram?(string1, string2)
  string1.split("").sort == string2.split("").sort
end

p anagram?("police", "ecliop")