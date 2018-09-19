class GameBoard
  def initialize
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @current_player = 'X'
  end

  def start_game
    while check_for_winner.nil?
      player_move
      show_board
      case check_for_winner
      when 'X'
        puts 'X has won the game!'
      when 'O'
        puts 'O has won the game!'
      when 'tie'
        puts 'No more squares left, it\'s a tie!'
      end
      switch_player
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
    puts "Ok player #{@current_player}, write the number of your selected field"
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
    until @cells[cell - 1] == ' '
      puts 'Please pick an empty field to continue.'
      cell = gets.to_i
    end
    @cells[cell - 1] = @current_player
  end

  def switch_player
    @current_player = if @current_player == 'X'
                        'O'
                      else
                        'X'
                      end
  end

  def check_for_winner
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]]
    wins.each do |win|
      return 'O' if win.map { |square| @cells[square] }.all?('O')
      return 'X' if win.map { |square| @cells[square] }.all?('X')
    end
    return 'tie' if @cells.none?(' ')
  end
end
