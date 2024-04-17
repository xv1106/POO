require 'bundler'
Bundler.require

require_relative '/Users/Xavier/Documents/THP/Week_4/mini_jeu_poo/lib/game'
require_relative '/Users/Xavier/Documents/THP/Week_4/mini_jeu_poo/lib/player'

puts "------------------------------------------------"
puts "| Welcome to 'THP Fight Night' !               |"
puts "| The goal of the game is to be the last one   |"
puts "| standing while two devs are attacking you!   |"
puts "------------------------------------------------"

puts "\nWhat's your name, Human?"
print "> "
player_name = gets.chomp
user = HumanPlayer.new(player_name) #création du joueur avec le getschomp du user


player1 = Player.new("Lilian")
player2 = Player.new("Maxime")
enemies = [player1, player2] #création de l'array enemies afin de faire attaquer Maxime et Lilian en même temps

# boucle de combat 
while user.life_points.positive? && (player1.life_points.positive? || player2.life_points.positive?) #la boucle ontinue tant que human HP > 0 OU BIEN player 1 OU 2 a > 0
  puts "\n"
  user.show_state

  # Menu display and user action handling
  puts "\nWhat's your next move human?"
  puts "a - search around for a better weapon"
  puts "s - search around for some heals"
  puts "attack a visible player:"
  puts "0 - Lilian has #{player1.life_points} life points" if player1.life_points.positive? # on affiche uniquement cette commande dans le menu si le joueur à plus de 0 points de vie
  puts "1 - Maxime has #{player2.life_points} life points" if player2.life_points.positive?
  print "> "
  user_action = gets.chomp

  case user_action
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(player1)
  when "1"
    user.attacks(player2)
  when "exit"
    puts "Exiting the game..."
    break   
  else
    puts "This move does not exist.. #{player_name} looks confused.. Please choose an existing move."
  end

  # Game over si les 
  break unless (player1.life_points.positive? || player2.life_points.positive?) # empêche la boucle de se lancer une dernière fois alors que les deux ennemies viennent de mourrir

  # Enemies attack the user
  puts "Other players are attacking you!"
  active_enemies = enemies.select { |enemy| enemy.life_points.positive? }
  active_enemies.each do |enemy|
    enemy.attacks(user)
  end
end

# Game over message
puts "--------Game over!--------"
if user_action == "exit"
  puts "You have forfeited the game (you coward!)"   
elsif user.life_points.positive?
  puts "Congratulations! You won!"
else
  puts "Sorry, you lost. Better luck next time!"
end
