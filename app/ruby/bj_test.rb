class Deck
  def initialize
    # shuffle array and init each Card
  end
end



#Build the deck of cards

rank = Array(1..13)
suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
deck = Array.new(52)
counter = 0

suits.each do |s|
  rank.each do |n|
    if n == 1
      cardname = "Ace"
      cardvalue = 11
    elsif n == 11
      cardname = "Jack"
      cardvalue = 10
    elsif n == 12
      cardname = "Queen"
      cardvalue = 10
    elsif n == 13
      cardname = "King"
      cardvalue = 10
    else
      cardname = n.to_s
      cardvalue = n
    end  
    deck[counter] = {:rank => (n.to_s), :suit => s, :cardname => cardname, :cardvalue => cardvalue}     
    counter +=1
  end
end

deck.shuffle!

#some test code

system("clear")
puts "This card is #{deck[3]}"

#Create a hand of 2 cards

card1 = deck.pop
card2 = deck.pop

puts "Card 1 is the #{card1[:cardname]} of #{card1[:suit]}" 
puts "Card 2 is the #{card2[:cardname]} of #{card2[:suit]}" 
p1_total = (card1[:cardvalue].to_i) + (card2[:cardvalue].to_i)
puts "Player 1 has #{p1_total}."

puts "There are #{deck.length} cards left in the deck."
