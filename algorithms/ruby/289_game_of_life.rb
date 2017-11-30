# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
require 'pp'
def game_of_life board  
  return board if board == [[]]
  dup_board = []     
  board.each do |e|
    dup_board << e.clone
  end
  board.each_with_index do |row, irow|
    row.each_with_index do |col, icol|
        live_neighbors = count_live_neighbors(dup_board, irow, icol)  
        puts "#{irow}x#{icol} live_neightbors: #{live_neighbors}"
        if board[irow][icol] == 1
          if live_neighbors < 2
            board[irow][icol] = 0
          elsif live_neighbors > 3
            board[irow][icol] = 0
          end
        elsif board[irow][icol] == 0 && live_neighbors == 3
          board[irow][icol] = 1            
        end
    end 
  end 
  board
end                   

def count_live_neighbors board, row, col 
    max_row = board.size
    max_col = board[0].size            

    top_row    = row-1
    left_col   = col-1
    right_col  = col+1
    bottom_row = row+1
    
    index_paths = []
    # top           
    index_paths << [top_row, col] if top_row >= 0  
    # left
    index_paths << [row, left_col] if left_col >= 0
    # bottom                               
    index_paths << [bottom_row, col] if bottom_row < max_row
    # right                                
    index_paths << [row, right_col] if right_col < max_col
    # top-left
    index_paths << [top_row, left_col] if top_row >= 0 && left_col >= 0
    # top-right
    index_paths << [top_row, right_col] if top_row >= 0 && right_col < max_col       
    # bottom-left
    index_paths << [bottom_row, left_col] if bottom_row < max_row  && left_col >= 0
    # bottom-right
    index_paths << [bottom_row, right_col] if bottom_row < max_row && right_col < max_col
    
    # count live_neighbors              
    live_neighbors = 0
    index_paths.each do |index_path|                             
      _row = index_path[0]                                           
      _col = index_path[1]
      puts "#{row}x#{col} board[#{_row}][#{_col}] = #{board[_row][_col]}"
      live_neighbors += 1 if board[_row][_col] == 1
    end  
    live_neighbors
end    

# board = [[0, 0, 0], 
#          [0, 1, 0], 
#          [1, 1, 1]]
#          
# puts count_live_neighbors board, 0, 0
# board = [[1]]
# PP.pp game_of_life board
# 
# board = [[0, 1]]
# PP.pp game_of_life board

board = [[0,0,0,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,0,0,0,0]]
PP.pp game_of_life board