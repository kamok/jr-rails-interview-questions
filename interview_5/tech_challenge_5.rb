## THus was a HACKERANK CHALLENGE

## Note, use STDIN.read to get data. gets doesn't work for some reason.

## Assume these 2 rules for your rock paper scissor opponent
## 1. If they play the same hand twice, they will repeat it
## 2. If they play different hands twice,
#  they'll pick a third, different hand on the next
# You always start with Rock, and another Rock

# How many times can you win given this hand?


opponent = "PSRRPS"

def get_my_moves(opponent_moves)
  possible_moves = ["R","P","S"]
  my_moves = "RR"

  (opponent_moves.length - 2).times do |i|
    observe = opponent_moves[i..i+1]
    if observe[0] != observe[1]
      possible_moves.delete(observe[0])
      possible_moves.delete(observe[1])
      my_moves += get_winning_move(possible_moves[0])
    elsif observe[0] == observe[1]
      my_moves += get_winning_move(observe[0])
    end
    possible_moves = ["R","P","S"]
  end
  my_moves
end

def calc_wins(my_moves, opponent_moves)
  winning_rules = ["RS", "SP", "PR"]
  times_won = 0
  (my_moves.length).times do |i|
    times_won += 1 if winning_rules.include?(my_moves[i] + opponent_moves[i])
  end
  times_won
end

def get_winning_move(opponnet_moves)
  {"S" => "R", "P" => "S", "R" => "P"}[opponnet_moves]
end

my_moves = get_my_moves(opponent)

p calc_wins(my_moves, opponent)


## You are working in an advertising agency. There are 100 billobards owned by your agency, numbered 1 to 100.
# Your clients send you requests, one after another. Each request is the number of the billboard
# on which the client would like to place his ad. 

# Initially all billboards are empty. Each time you receive a request, you do:
# If the billboard is empty, you occupy the billboard with the ad.
# If it's occupied, you reject it 

## Given a string containing the requests in the order you receive them, comma seperated list
# of integers, return the number of rejected requests 

## Eg: 1,2,3,4 => 0
## 1,2,1,2 => 2

def repeat?(string)
  string = string.split(",")
  string.count - string.uniq.count
end

n = "1,2,3,4"
puts repeat?(n)