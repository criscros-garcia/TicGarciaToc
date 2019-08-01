board =[
  ["X","X","X"],
  ["O","X","O"]
]


def won?(board)
  board.each do |row|
    puts row.uniq.length == 1 ? true : false
    break
  end  
end


board.each do |row|
  puts "#{row.uniq}"
end  

won?(board) 