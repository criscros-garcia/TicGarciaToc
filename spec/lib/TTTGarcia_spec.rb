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
    
    it 'takes movements'
    it 'displays a board'
    it 'shows a winner'
  end

end