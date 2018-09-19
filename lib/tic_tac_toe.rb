# Still need to check for winning condition
# If you try 2 times you can overwrite a field
# Not the most efficient code

class GameBoard
  
  def initialize
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @current_player = 'X'
    while 1 < 1000
    player_move
    end
  end
  
  def show_board
    puts "
           a       b       c
       +-------+-------+-------+
       |       |       |       |
     1 |   #{@cells[0]}   |   #{@cells[1]}   |   #{@cells[2]}   |
       |       |       |       |
       +-------+-------+-------+
       |       |       |       |
     2 |   #{@cells[3]}   |   #{@cells[4]}   |   #{@cells[5]}   |
       |       |       |       |
       +-------+-------+-------+
       |       |       |       |
     3 |   #{@cells[6]}   |   #{@cells[7]}   |   #{@cells[8]}   |
       |       |       |       |
       +-------+-------+-------+
    "
  end
  
  def player_move
    puts "Ok player #{@current_player}, Please write the number of you selected field"
    puts '1. a1'
    puts '2. b1'
    puts '3. c1'
    puts '4. a2'
    puts '5. b2'
    puts '6. c2'
    puts '7. a3'
    puts '8. b3'
    puts '9. c3'
    cell = gets.to_i
    unless cell === (1..9) || @cells[cell-1] == ' '
      puts 'Please pick a number between 1 and 9 that hasn´t being played.'
      cell = gets.to_i
    end
    @cells[cell - 1] = @current_player
    if @current_player == 'X'
      @current_player = 'O'
    else
      @current_player = 'X'
    end
    show_board
  end
  
  def show_current_player
    puts @current_player
  end
end

my_game = GameBoard.new