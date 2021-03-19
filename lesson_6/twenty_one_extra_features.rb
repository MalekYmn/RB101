GOAL_SCORE = 21
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
    score -= 10 if score > GOAL_SCORE
  end
  score
end

def bust?(score)
  score > GOAL_SCORE
end

def player_hit_or_stay(cards, current_deck)
  score = calculate_cards(cards)
  loop do
    answer = ''
    loop do
      prompt '(h)it or (s)tay?'
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      prompt "Sorry, must enter a valid answer (h or s)"
    end

    if answer == 'h'
      cards << draw_card!(current_deck)
      score = calculate_cards(cards)
      display_cards_and_score('player', cards, score)
    end

    break if bust?(score) || answer == 's'
  end
  cards
end

def dealer_hit_or_stay(cards, current_deck)
  loop do
    score = calculate_cards(cards)
    break unless score < GOAL_SCORE - 4
    prompt 'dealer is choosing to hit'
    cards << draw_card!(current_deck)
  end
  cards
end

def show_one_dealer_card(cards)
  card = cards.sample.to_s
  prompt "One of dealer's cards is #{card}"
end

def detect_result(player_score, dealer_score)
  if bust?(player_score)
    'You busted! Dealer wins!'
  elsif bust?(dealer_score)
    'Dealer busted! You win!'
  elsif player_score > dealer_score
    'You won!'
  elsif dealer_score > player_score
    'Dealer won!'
  else
    "It's a tie!"
  end
end

def wins_counter!(wins, player_score, dealer_score)
  result = detect_result(player_score, dealer_score)

  case result
  when 'You busted! Dealer wins!', 'Dealer won!'
    wins[1] += 1
  when 'Dealer busted! You win!', 'You won!'
    wins[0] += 1
  end
end

def display_result(player_cards, dealer_cards, player_score, dealer_score)
  display_cards_and_score('Your', player_cards, player_score)
  display_cards_and_score('Dealer', dealer_cards, dealer_score)
end

def display_cards_and_score(player, cards, score)
  prompt "#{player} cards are: #{cards}, with a value of #{score}"
end

def detect_grand_winner(wins)
  if wins[0] == 5
    'You are the grand winner!'
  else
    'Dealer is the grand winner!'
  end
end

loop do
  prompt "Welcome to #{GOAL_SCORE}!"
  wins = [0, 0]
  loop do
    deck = initial_deck
    dealer_cards = initial_cards!(deck)
    player_cards = initial_cards!(deck)
    player_score = calculate_cards(player_cards)
    display_cards_and_score('player', player_cards, player_score)
    show_one_dealer_card(dealer_cards)
    player_hit_or_stay(player_cards, deck)
    player_score = calculate_cards(player_cards)
    dealer_score = calculate_cards(dealer_cards)
    unless bust?(player_score)
      dealer_hit_or_stay(dealer_cards, deck)
      dealer_score = calculate_cards(dealer_cards)
      display_result(player_cards, dealer_cards, player_score, dealer_score)
    end
    prompt detect_result(player_score, dealer_score)
    wins_counter!(wins, player_score, dealer_score)
    prompt "You have #{wins[0]} wins!. Dealer has #{wins[1]} wins!"
    break if wins.include?(5)
  end

  prompt detect_grand_winner(wins)
  prompt 'want to play again?'
  answer = gets.chomp!
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing #{GOAL_SCORE}!"
