require 'bundler'
require_relative "lib/player"
require_relative "lib/game"
Bundler.require

def perform()
    puts "___________________________________________________________"
    puts "Bienvenue sur le jeu avec le perso le plus CHEATÉ au monde"
    puts "Si t'es pas le dernier survivant de ce jeu, t'es vraiment un NOOBY"
    puts "__________________________________________________________________"

    puts "Quel est ton prénom ?"
    name_human = gets.chomp
    my_game = Game.new(name_human)

    puts "\nPassons au FIGHT !"

    i = 1

    while Player.all.length > 0 || @cheat_human.check_life_points > 0

        my_game.show_players()

        my_game.human_menu(i)

        my_game.human_choice_action()
        break if Player.all.length <= 0

        my_game.enemies_attacks()
        i += 1
    end

    my_game.end_game()
end

perform()