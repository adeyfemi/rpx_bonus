SHORT_CHOICES = %w(r p x l sp)
VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts(message)
end

def player_choice
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(' , ')} or #{SHORT_CHOICES.join('/')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice) || SHORT_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
      prompt("You can use the following short cuts:
        r - rock,
        p - paper,
        x - scissors,
        l - lizard,
        sp - spock")
    end
  end
  choice
end

def validated_move(input)
  if input == 'r' || input == 'rock'
    input = 'rock'
  elsif input == 'p' || input == 'paper'
    input = 'paper'
  elsif input == 'x' || input == 'scissors'
    input = 'scissors'
  elsif input == 'l' || input == 'lizard'
    input = 'lizard'
  elsif input == 'sp' || input == 'spock'
    input = 'spock'
  else
    puts "Choose one of the options provided at start."
  end
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
  (first == 'paper' && (second == 'rock' || second == 'spock')) ||
  (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
  (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
  (first == 'spock' && (second == 'rock' || second == 'scissors'))
end

def display_result(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

# *******************************************************************************

loop do
  player_score = 0
  computer_score = 0

  prompt("The game is first to 5!------GOODLUCK!!!")

  loop do
    prompt("Player: #{player_score} vs CPU: #{computer_score}")
    
    player_move = player_choice
    computer_choice = VALID_CHOICES.sample
    lf_player_choice = validated_move(player_move)

    prompt("You chose: #{lf_player_choice}; Computer chose: #{computer_choice}")

    winner = display_result(lf_player_choice, computer_choice)
  
    if winner == 'You won!'
      player_score += 1
    elsif winner == 'Computer won!'
      computer_score += 1
    end

    if player_score == 5
      break
    elsif computer_score == 5
      break
    end
  end

  prompt("Player: #{player_score} vs CPU: #{computer_score}")

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp().downcase
  break unless answer == 'yes' || answer == 'y'
  prompt("Please enter yes/y to replay or no/n to exit.")
end

prompt("Thank you for playing. Good bye!")

system('clear') || system('cls')


