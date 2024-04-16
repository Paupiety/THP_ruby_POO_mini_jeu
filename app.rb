require 'bundler'
require_relative "lib/player"
require_relative "lib/game"
Bundler.require

def perform()
    player1 = Player.new("José")
    player2 = Player.new("Josiane")
    puts "Voici l'état de nos joueurs :"
    puts player1.initial_life
    puts player2.initial_life
    puts "\nPassons au combat !"
    i = 0
    while player1.life_points > 0 || player2.life_points > 0
        puts "Round #{i}"
        player2.attacks(player1)
        break if player1.life_points <= 0
        player1.attacks(player2)
        break if player2.life_points <= 0
        puts "\nVoyons l'état de nos joueurs..."
        puts player1.showstate
        puts player2.showstate
        i += 1
    end
end

perform()