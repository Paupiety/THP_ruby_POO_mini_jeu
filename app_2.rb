require 'bundler'
require_relative "lib/player"
require_relative "lib/game"
Bundler.require

def choice_touch_action()
    return action = gets.chomp
end

def human_menu(i, player1, player2)
    puts "\nRound #{i}"
    puts "Quelle action veux-tu effectuer ?"
    puts "1 - Chercher une meilleure arme"
    puts "2 - Chercher une popo de soin"
    puts "3 - Attaquer un joueur en vue :"
    puts "a - #{player1.showstate}" if player1.life_points > 0
    puts "b - #{player2.showstate}" if player2.life_points > 0
end

def human_choice_action(player1, player2, cheat_human)
    action = choice_touch_action()
    if action == "1"
        puts cheat_human.search_weapon()
    elsif action == "2"
        puts cheat_human.search_popo()
    elsif action == "a"
        puts cheat_human.attacks(player1)
    elsif action == "b"
        puts cheat_human.attacks(player2)
    else
        puts "Appuie sur une bonne touche quand même... Re-essaie"
        human_choice_action(player1, player2, cheat_human)
    end
    
end

def creation_cheat_human()
    puts "Quel est ton prénom ?"
    humanplayer = gets.chomp
    cheat_human = HumanPlayer.new(humanplayer)
    return cheat_human
end

def creation_player1()
    player1 = Player.new("José")
    return player1
end

def creation_player2()
    player2 = Player.new("Josiane")
    return player2
end

def perform()
    puts "___________________________________________________________"
    puts "Bienvenue sur le jeu avec le perso le plus CHEATÉ au monde"
    puts "Si t'es pas le dernier survivant de ce jeu, t'es vraiment un NOOBY"
    puts "__________________________________________________________________"
    cheat_human = creation_cheat_human()
    player1 = creation_player1()
    player2 = creation_player2()

    puts "\nPassons au FIGHT !"

    i = 1
    while player1.life_points > 0 && player2.life_points > 0 || cheat_human.life_points > 0

        puts "\nVoyons ton état cheaté..."
        puts "Tu as #{cheat_human.life_points} points de vie\n"

        human_menu(i, player1, player2)

        puts human_choice_action(player1, player2, cheat_human)
        break if player2.life_points <= 0 && player1.life_points <= 0

        puts "Les autres joueurs t'attaquent !"
        Player.all.each do |player|
            if player.life_points > 0
                player.attacks(cheat_human)
                break if cheat_human.life_points <= 0
            end
        end
        break if cheat_human.life_points <= 0

        i += 1
    end
    puts "La partie est terminé"
    if cheat_human.life_points > 0
        puts "BRAVO ! T'as gagné ! Même si c'était pas très compliquée..."
    else
        puts "PERDU ! T'es vraiment un nooby..."
    end

    puts "Tu veux faire une autre partie ? Tape oui ou non"
    choice = gets.chomp
    if choice == "oui"
        perform()
    elsif choice == "non"
        puts "Dommage, à bientôt !"
    else
        puts "Ni oui ni non, je prend ça pour non :P"
    end
end

perform()