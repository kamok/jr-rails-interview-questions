# Design an algorithm and write code to remove the duplicate characters in a string without using any additional buffer. 
# NOTE: One or two additional variables are fine. An extra copy of the array is not.
# FOLLOW UP
# Write the test cases for this method.

s = "hello world"

def remove_dups(string)
  checked_chars = []
  string.each_char do |char|
    checked_chars << char if checked_chars.include?(char) == false
  end
  checked_chars.join
end

p remove_dups(s)

context "When testing the remove_dups method" do 
  it "should say 'helo' when we call the remove_dups method with 'hello' " do
    message = remove_dups('hello')
    expect(message).to eq("helo")
  end

  it "should say 'kamo' when we call the remove_dups method with 'kamok' " do
    message = remove_dups('kamok')
    expect(message).to eq("kamo")
  end

  it "should say '1234' when we call the remove_dups method with '1234321' " do
    message = remove_dups('1234321')
    expect(message).to eq("1234")
  end

  it "should say '#TextME' when we call the remove_dups method with '##TexTtME' " do
    message = remove_dups('##TexTtME')
    expect(message).to eq("#TextME")
  end
end