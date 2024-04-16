#classe pour les joueurs ennemis / les 2 joueurs de app.rb
class Player
    attr_accessor :name, :life_points
    @@enemies = []
    def initialize(player_name)
        enemies = []
        @name = player_name
        @life_points = 10
        @@enemies << self
    end

    def Player.all()
        return @@enemies
    end
# pour avoir les points de vie de base (changement de phrase pour showstate)
    def initial_life()
        return "#{@name} a #{@life_points} vies"
    end

    def showstate()
        return "#{@name} n'a plus que #{@life_points} vies"
    end

    # méthode qui s'adapte (execute) en fonction de l'état des joueurs
    def gets_damage(number)
        if @life_points <= 0
            puts "#{@name} a été tué..."
        elsif @life_points > 0 && number > 0
            puts "#{@name} a perdu #{number} points de vie !"
        else 
            puts "#{@name} a eu de la chance, il a perdu aucune vie !"
        end
    end

    # pour que le joueur attaque ou les ennemis attaquent le joueur
    def attacks(player)
        puts "#{@name} attaque #{player.name}"
        number_attack = compute_damage()
        puts "#{@name} lui inflige #{number_attack} dégats"
        player.life_points = player.life_points - number_attack
        player.gets_damage(number_attack)
    end

    # création d'un dé pour avoir des attaques aléatoires
    def compute_damage
        return rand(1..6)
    end

end

#pour app_2 et app_3 : ajout du joueur humain
class HumanPlayer < Player
    attr_accessor :weapon_level
    @@HumanPlayer = []
    def initialize(player_name)
        @name = player_name
        @life_points = 100
        @weapon_level = 1
    end

    def check_life_points()
        return @life_points
    end

    def initial_life()
        return "#{@name} a #{@life_points} vies et une arme de lvl #{@weapon_level}"
    end

    def compute_damage()
        return rand(1..6) * @weapon_level
    end

    def search_weapon()
        lvl_new_weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{lvl_new_weapon}"
        if lvl_new_weapon > @weapon_level
            @weapon_level = lvl_new_weapon
            puts "Cool ! elle est plus costaud que ton arme, tu la prends"
        else
            puts "Fait i@e$#ch, elle est nulle..."
        end
    end

    def search_popo()
        lvl_popo = rand(1..6)
        if lvl_popo == 1
            puts "Pas de popo à l'horizon..."
        elsif lvl_popo >= 2 && lvl_popo <= 5
            puts "Coool ! Tu as trouvé une popo de 50 pts de vie"
            if @life_points <= 50
                @life_points = @life_points + 50
                puts "Tu as maintenant #{@life_points} points de vie"
            else 
                @life_points = 100
                puts "Tu as maintenant le max de ta vie : #{@life_points}"
            end
        elsif lvl_popo == 6
            puts "C'est le pompon sur la Garonne ! Tu as trouvé une popo de +80 pts de vie !"
            if @life_points <= 30
                @life_points = @life_points + 80
                puts "Tu as maintenant #{@life_points} points de vie"
            else 
                @life_points = 100
                puts "Tu as maintenant le max de ta vie : #{@life_points}"
            end
        end
    end
end