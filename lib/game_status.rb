# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def full?(board)
  index = 0
  while index < board.length
    if board[index] == " " then
      return false
    end
    index += 1
  end
  return true
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

def won?(board) 
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]] 
    position_2 = board[win_combination[1]] 
    position_3 = board[win_combination[2]] 
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||(position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination 
    end
  end
  return false
end

def draw?(board)
  if won?(board) 
    false
  else 
    true
  end
end

def over?(board)
  if !(full?(board)) && won?(board) == false
    false
  elsif won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    win_combination = won?(board)
    if board[win_combination[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end