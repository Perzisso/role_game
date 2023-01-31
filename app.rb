require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("josé")

# Boucler sur le nombre de tour en fonction des PV

while player1.life_points > 0 && player2.life_points > 0
    puts "**"*20
    puts "Voici l'état des joueurs"
    puts "**"*20
    puts " #{player1.show_state}"
    puts " #{player2.show_state}"

    puts "__"*20
    puts "Passons à l'attaque"
    puts "__"*20

    player1.attacks(player2)
    puts "__"*20
    if player2.life_points <= 0
      puts "fin du jeu"
      puts "*"*20
      break
    end
    player2.attacks(player1)

  
end
  

