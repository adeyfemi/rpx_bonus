SHORT_CHOICES = %w(r p x l sp)
VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_MOVES = {
  'rock'=> ['scissors','lizard'],
  'paper' => ['rock','spock'],
  'scissors'=> ['paper','lizard'],
  'lizard'=> ['paper','spock'],
  'spock'=> ['rock','scissors']
}

def prompt(message)
  Kernel.puts(message)
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

def player_choice
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(' , ')} or #{SHORT_CHOICES.join('/')}")
    choice = Kernel.gets().chomp()

    if validated_move(choice)
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

def win?(first, second)
  VALID_MOVES[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

player_score = 0
computer_score = 0

# *******************************************************************************

loop do

  prompt("The game is first to 5!------GOODLUCK!!!")
  
  player_move = player_choice

  computer_choice = VALID_CHOICES.sample

  long_form_name = validated_move(player_move)

  prompt("You chose: #{long_form_name}; Computer chose: #{computer_choice}")

  winner = display_result(player_move, computer_choice)

  loop do
    if winner == "You won!"
      player_score += 1
    elsif winner == "Computer won!"
      computer_score += 1
    end

    if player_score == 5
      prompt("You win!. You are the grand winner!")
      break
    elsif computer_score == 5
      prompt("Computer wins. Computer is the grand winner!")
      break
    end
  end

  prompt("Player: #{player_score} vs CPU: #{computer_score}")

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase == 'y' || answer.downcase == 'yes'
end

prompt("Thank you for playing. Good bye!")

system('clear') || system('cls')


