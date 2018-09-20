require 'tic_tac_toe'

describe TicTacToe do
  subject(:game) { TicTacToe.new }

  it { is_expected.to respond_to(:show_board) }
  it { is_expected.to respond_to(:player_move) }
  it { is_expected.to respond_to(:check_for_winner) }
  it { is_expected.to respond_to(:switch_player) }
  it { is_expected.to respond_to(:start_game) }

  describe "#check_for_winner returns 'X', 'O', 'tie', if a game ending conditions has been met" do
    win_x = TicTacToe.new
    win_o = TicTacToe.new
    tie = TicTacToe.new

    context "when top row is taken by 'X'" do
      it "should return 'X'" do
        win_x.cells = ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
        expect(win_x.check_for_winner).to eq('X')
      end
    end

    context "when a vertical row is taken by 'X'" do
      it "should return 'X'" do
        win_x.cells = ['X', ' ', ' ', 'X', ' ', ' ', 'X', ' ', ' ']
        expect(win_x.check_for_winner).to eq('X')
      end
    end

    context "when a diagonal row is taken by 'X'" do
      it "should return 'X'" do
        win_x.cells = ['X', ' ', ' ', ' ', 'X', ' ', ' ', ' ', 'X']
        expect(win_x.check_for_winner).to eq('X')
      end
    end

    context "when top row is taken by 'O'" do
      it "should return 'O'" do
        win_o.cells = ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' ']
        expect(win_o.check_for_winner).to eq('O')
      end
    end

    context "when a vertical row is taken by 'O'" do
      it "should return 'O'" do
        win_o.cells = ['O', ' ', ' ', 'O', ' ', ' ', 'O', ' ', ' ']
        expect(win_o.check_for_winner).to eq('O')
      end
    end

    context "when a diagonal row is taken by 'O'" do
      it "should return 'O'" do
        win_o.cells = ['O', ' ', ' ', ' ', 'O', ' ', ' ', ' ', 'O']
        expect(win_o.check_for_winner).to eq('O')
      end
    end

    context 'when all rows are taken' do
      context "and there are 3 in a row of 'X' or 'O'" do
        it "should return 'X'" do
          win_x.cells = ['X', 'O', 'X', 'O', 'X', 'X', 'O', 'O', 'X']
          expect(win_x.check_for_winner).to eq('X')
        end
        it "should return 'O'" do
          win_o.cells = ['O', 'X', 'O', 'X', 'O', 'O', 'X', 'X', 'O']
          expect(win_o.check_for_winner).to eq('O')
        end
      end

      context 'and there is no winner' do
        it 'should be a tie' do
          tie.cells = ['O', 'X', 'O', 'X', 'X', 'O', 'O', 'O', 'X']
          expect(tie.check_for_winner).to eq('tie')
        end
      end
    end
  end

  describe '#player_move will place a @current_player marked on the choosen cell' do
    move = TicTacToe.new
    it 'should place marker on a1' do
      allow(move).to receive(:gets).and_return(1)
      expect(move.player_move).to eq(move.cells[0])
    end

    it 'should place current marker on c3' do
      allow(move).to receive(:gets).and_return(9)
      expect(move.player_move).to eq(move.cells[8])
    end
  end

  describe "#switch_player alternates @current_player between player 'X' and 'O'" do
    subject(:game) { TicTacToe.new }
    context "@current_player is 'X'" do
      it "should change it to 'O'" do
        expect(game.switch_player).to eq('O')
      end
    end

    context "@current_player is 'O'" do
      it "should change it to 'X'" do
        game.switch_player
        expect(game.switch_player).to eq('X')
      end
    end
  end

  describe '#end_game if a game ending condition is met, puts the corresponding message' do
    context "when #check_for_winner returns 'X'" do
      it "should declare 'X' the winner" do
        expect { game.end_game('X')}.to output("X has won the game!\n").to_stdout
      end
    end

    context "when #check_for_winner returns 'O'" do
      it "should declare 'O' the winner" do
        expect { game.end_game('O')}.to output("O has won the game!\n").to_stdout
      end
    end

    context "when #check_for_winner returns 'tie'" do
      it 'should declare a tie' do
        expect { game.end_game('tie')}.to output("No more squares left, it's a tie!\n").to_stdout
      end
    end
  end
end
