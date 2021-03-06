class Hand

  attr_accessor :cards, :total

  def initialize(deck)
    @cards = [] 
    @total = 0
    self.cards = (0..1).to_a.map { |id| deck.cards.pop }
    self.calc_total
  end

  def calc_total
    self.total = 0
    self.cards.each do |c|
      if c.rank == "A" 
        self.total += 11
      elsif c.rank == "J" || c.rank == "Q" || c.rank == "K"
        self.total += 10 
      else
         self.total += c.rank.to_i
      end
    end
  end

  def next_card(deck)
    self.cards.push(deck.cards.pop)
    self.calc_total
  end

  def show_hand
    self.cards.each do |c|
      puts "#{c.rank} of #{c.suit}s  "
    end
    #puts "\n"
  end

  def show_dealer_hand
    self.cards[1..(self.cards.length)].each do |c|
      puts "#{c.rank} of #{c.suit}s  "
    end  
    puts "<this card is face down>"
  end

end