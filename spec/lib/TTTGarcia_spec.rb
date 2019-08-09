RSpec.describe TTTGarcia do
  it "has a version number" do
    expect(TTTGarcia::VERSION).not_to be nil
  end

  context 'Game' do
    it 'starts a game' do
      game = TTTGarcia::Game.new
      expect(game).to respond_to("start")
    end

    it 'asks for a dimention' do
      game = TTTGarcia::Game.new
      expect(game).to receive(:gets).and_return("3")
      game.build
      expect(game.dimention).to eq(3)
    end
    
    describe '#valid_dimention?' do
      it 'returns true if the dimention is in range' do
        game = TTTGarcia::Game.new        
        expect(game.valid_dimention?(3)).to be true
      end
      it 'returns false if the dimention is not in range' do
        game = TTTGarcia::Game.new        
        expect(game.valid_dimention?(11)).to be false
      end
    end

    describe '#position_taken?' do
      it 'returns true if the position is free' do
        game = TTTGarcia::Game.new        
        game.board = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]
        expect(game.position_taken?(0)).to be true
      end
      it 'returns false if the position is not free' do
        game = TTTGarcia::Game.new        
        game.board = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]
        expect(game.position_taken?(1)).to be false
      end
    end

    describe '#valid_move?' do
      it 'returns true if the move is valid' do
        game = TTTGarcia::Game.new        
        game.board = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]
        game.dimention = 3
        expect(game.valid_move?(1)).to be true
      end
      it 'returns false if the move is not valid' do
        game = TTTGarcia::Game.new        
        game.board = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]
        game.dimention = 3
        expect(game.valid_move?(0)).to be false
      end
    end



  end

end