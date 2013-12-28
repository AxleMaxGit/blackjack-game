class BlackjackController < ActionController::Base
  
  def index
    @game1 = Game.new

    @game1.players[0] = Player.new("Alex", false)
    @game1.players[1] = Player.new("Clare", false)
    @game1.players[2] = Player.new("Dealer", true)

    @game1.deal(@game1.deck)
  end
end