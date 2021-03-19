SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']
CARDS_VALUES = {
  'Ace' => 11,
  2 => 2,
  3 => 3,
  4 => 4,
  5 => 5,
  6 => 6,
  7 => 7,
  8 => 8,
  9 => 9,
  10 => 10,
  'Jack' => 10,
  'Queen' => 10,
  'King' => 10
}

def prompt(message)
  puts "=> #{message}"
end

def initial_deck
  {
    'Clubs' => ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'],
    'Diamonds' => ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'],
    'Hearts' => ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'],
    'Spades' => ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King']
  }
end

def draw_card!(current_deck)
  suit = SUITS.sample
  card = current_deck[suit].sample
  current_deck[suit].delete(card)
end

def initial_cards!(current_deck)
  player_cards = []
  2.times do
    player_cards << draw_card!(current_deck)
  end
  player_cards
end

def calculate_cards(cards)
  score = 0
  cards.each do |card|
    score += CARDS_VALUES[card]
  end
  cards.select { |card| card == 'Ace' }.count.times do
    score -= 10 if score > 21
  end
  score
end

def bust?(cards)
  calculate_cards(cards) > 21
end

def player_hit_or_stay(cards, current_deck)
  loop do
    prompt 'hit or stay?'
    answer = gets.chomp!
    break if answer.downcase == 'stay'
    cards << draw_card!(current_deck)
    prompt "your current cards are #{cards}"
    break if bust?(cards)
  end
  cards
end

def dealer_hit_or_stay(cards, current_deck)
  loop do
    score = calculate_cards(cards)
    break unless score < 17
    prompt 'dealer is choosing to hit'
    cards << draw_card!(current_deck)
  end
  cards
end

def show_one_dealer_card(cards)
  card = cards.sample.to_s
  prompt "One of dealer's cards is #{card}"
end

def closer_to_21(player_cards, dealer_cards)
  player_score = 21 - calculate_cards(player_cards)
  dealer_score = 21 - calculate_cards(dealer_cards)
  prompt "dealer cards are: #{dealer_cards}.
          Your cards are: #{player_cards}"
  if player_score < dealer_score
    "Player won!"
  elsif dealer_score < player_score
    "Dealer won!"
  else
    "It's a tie!"
  end
end

def display_result(player_cards, dealer_cards)
  if bust?(player_cards)
    puts 'You went bust!'
  elsif bust?(dealer_cards)
    puts "Dealer went bust, you won!"
  else
    puts closer_to_21(player_cards, dealer_cards)
  end
end
loop do
  deck = initial_deck
  prompt 'Welcome to 21!'
  player_cards = initial_cards!(deck)
  dealer_cards = initial_cards!(deck)
  prompt "your cards are #{player_cards}"
  show_one_dealer_card(dealer_cards)
  player_hit_or_stay(player_cards, deck)
  dealer_hit_or_stay(dealer_cards, deck)
  display_result(player_cards, dealer_cards)

  prompt 'want to play again?'
  answer = gets.chomp!
  break unless answer.downcase.start_with?('y')
end
