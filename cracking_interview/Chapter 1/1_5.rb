# Write a method to replace all spaces in a string with "%20"

def space_encoding(string)
  string.split("").map { |char| char == " " ? char = "%20" : char}.join
end

p space_encoding("Kill all humans!")