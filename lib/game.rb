require_relative 'player'


class Game
    attr_accessor :cheat_human
# Méthode pour la création du joueur humain + création automatique des ennemis
    def initialize(name_human)
        @cheat_human = HumanPlayer.new(name_human)
        player1 = Player.new("José")
        player2 = Player.new("Josiane")
        player3 = Player.new("Clodette")
        player4 = Player.new("Jean-Pierre")
    end
    
    # Méthode pour supprimer un ennemi du tableau s'il est mort  
    def kill_player()
        Player.all.each do |player|
            if player.life_points <= 0
                Player.all.delete(player)
            end
        end
    end

    # méthode pour savoir si la partie continue ou non (pas encore utilisée)
    def is_still_ongoing?()
        find = false
        if Player.all == [] && self.life_points > 0
            find = true
            puts "La partie continue !"
        else
            puts "La partie est terminé"
        end
        return find
    end

    # méthode pour voir l'état du jeu (pour le joueur humain et le nb n'ennemi qui lui reste)    
    def show_players()
        puts "\nVoyons ton état cheaté..."
            puts "Tu as #{@cheat_human.check_life_points} points de vie\n"
        puts "Il te reste #{Player.all.length} ennemies à tuer"
    end

    # méthode pour le menu présentant les choix au joueur
    def human_menu(i)
        puts "\nRound #{i}"
        puts "Quelle action veux-tu effectuer ?"
        puts "1 - Chercher une meilleure arme"
        puts "2 - Chercher une popo de soin"
        puts "3 - Attaquer un joueur en vue :"
        puts "a - #{Player.all[0].showstate}" if Player.all[0]
        puts "b - #{Player.all[1].showstate}" if Player.all[1]
        puts "c - #{Player.all[2].showstate}" if Player.all[2]
        puts "d - #{Player.all[3].showstate}" if Player.all[3]
    end

    # méthode pour enregistrer l'entrée du joueur via le gets.chomp (pour pouvoir retourner à nouveau dessus s'il y a une erreur de saisie)
    def choice_touch_action()
        return action = gets.chomp
    end
    
    # méthode qui execute les actions que veut le joueur + utilisation de la méthode kill_player
    def human_choice_action()
        action = choice_touch_action()
        if action == "1"
            puts @cheat_human.search_weapon()
        elsif action == "2"
            puts @cheat_human.search_popo()
        elsif action == "a"
            puts @cheat_human.attacks(Player.all[0])
        elsif action == "b"
            puts @cheat_human.attacks(Player.all[1])
        elsif action == "c"
            puts @cheat_human.attacks(Player.all[2])
        elsif action == "d"
            puts @cheat_human.attacks(Player.all[3])
        else
            puts "Appuie sur une bonne touche quand même... Re-essaie"
            human_choice_action()
        end
        kill_player() 
    end

    # méthode pour que tous les ennemis attaquent à la suite
    def enemies_attacks()
        puts "Les autres joueurs t'attaquent !"
        Player.all.each do |player|
                if player.life_points > 0
                    player.attacks(@cheat_human)
                    break if @cheat_human.check_life_points <= 0
                end
            end
    end

    # méthode pour la fin de partie
    def end_game()
        puts "La partie est terminé"
        if @cheat_human.check_life_points > 0
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
end