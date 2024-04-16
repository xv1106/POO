require 'bundler'
require 'pry'
Bundler.require

require_relative '/Users/Xavier/Documents/THP/Week_4/mini_jeu_poo/lib/game'
require_relative '/Users/Xavier/Documents/THP/Week_4/mini_jeu_poo/lib/player'

player1 = Player.new("Lilian")
player2 = Player.new("Maxime")


puts "Ladies and gentlemen, we are live from the THP Arena"
puts "Ittttt'sss..... TIIIIMMMMEEEEE! The moment you have all been waiting for"

puts "Introducing first, fighting out of the blue corner, this man is a mixed martial artist, standing 6 feet 4 inches tall, weighing in at 205 pounds, with a professional record of 152-0-0. Fighting out of Paris and representing France, he is widely regarded as one of the greatest fighters of all time! Ladies and gentlemen, please welcome... Lilian 'The GOAT' Muller.

And now, introducing his opponent, fighting out of the red corner! This man is a 3 feet 3 inches tall, weighing in at 102 pounds, with a professional record of 1-46-2. Fighting out of Bruxelles and proudly representing Belgium! He is not a knockout artist and one of the less feared fighters in the world today! Please welcome... Maxime 'Easy fight' Lodato!

And when the action begins, our referee in charge of the octagon is Xavier Kerleau."


def fight(player1, player2) 
  puts "\n"
  puts "Aaaaaannnd...FIGHT!"

  while player1.life_points > 0 && player2.life_points > 0 
  puts "\n"
  player1.show_state
  player2.show_state
  
  puts "\n"
  player1.attacks(player2)
    break if player2.life_points <= 0
    
  player2.attacks(player1)
    break if player1.life_points <= 0
  end
end

fight(player1, player2)



