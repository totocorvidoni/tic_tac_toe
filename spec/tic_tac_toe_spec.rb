require 'tic_tac_toe'

describe TicTacToe do
  it { is_expected.to respond_to(:show_board) }
  it { is_expected.to respond_to(:player_move) }
  it { is_expected.to respond_to(:check_for_winner) }
  it { is_expected.to respond_to(:switch_player) }
  it { is_expected.to respond_to(:start_game) }

  describe "#check_for_winner returns 'X', 'O', 'tie', if a game over conditions has been met" do
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
end
