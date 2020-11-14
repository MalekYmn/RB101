VALID_CHOICES = ["rock", "paper", "scissors", "spock", "lizard"]
VALID_KEYS = { r: "rock", p: "paper", sc: "scissors", sp: "spock", l: "lizard" }
WINING_MOVES = {
  rock: ["scissors", "lizard"],
  scissors: ["paper", "lizard"],
  paper: ["rock", "spock"],
  lizard: ["spock", "paper"],
  spock: ["rock", "scissors"]
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WINING_MOVES[first.to_sym].include?(second)
end

def display_result(player, computer, player_wins, computer_wins)
  if win?(player, computer)
    prompt("You won #{player_wins} times!")
  elsif player == computer
    prompt("It's a tie!")
  else
    prompt("Computer won #{computer_wins} times!")
  end
end

loop do
  player_wins = 0
  computer_wins = 0

  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice)
        break
      elsif VALID_KEYS.include?(choice.to_sym)
        choice = VALID_KEYS[choice.to_sym]
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}. Computer chose #{computer_choice}")

    if win?(choice, computer_choice)
      player_wins += 1
    elsif win?(computer_choice, choice)
      computer_wins += 1
    end

    display_result(choice, computer_choice, player_wins, computer_wins)

    if player_wins == 5
      prompt("You're the grand winner!")
      break
    elsif computer_wins == 5
      prompt("computer is the grand winnner!")
      break
    end
  end

  prompt('do you want to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt("Thank you for playing. Goodbye!")
