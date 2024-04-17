require 'pry'

class Player
  attr_accessor :name, :life_points #On définit nos attribus avec attr_accessor

  def initialize(name) #Méthode d'initialisation de mes fighters avec deux variable d'instances par défaut
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} has #{@life_points} HP"
  end

  def gets_damage(damage_received)
    @life_points -= damage_received #soustrait les points de dégats des PV du player
    if @life_points <= 0
      puts "The fighter #{@name} has been killed in the action!"
    end
  end  

  def attacks(player)
    puts "#{@name} launches an attack on #{player.name}!"
    damage = compute_damage
    puts "#{damage} damage points have been inflicted..."
    player.gets_damage(damage)
  end

  def compute_damage
    rand(1..6)
  end
end

class HumanPlayer < Player # < indique l'héritage de Human player sur la classe player
  attr_accessor :weapon_level

  def initialize(name)
    super(name) #super reprend l'attribut name de notre classe Player
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} has #{@life_points} HP and a weapon level of #{@weapon_level}"
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "You found a level #{new_weapon_level} weapon!"
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "It's better than your current shitty weapon, you grab it."
    else
      puts "Oh shit, this weapong sucks..."
    end
  end

  def search_health_pack
    dice_roll = rand(1..6)
    if dice_roll == 1
      puts "You didn't find anything..."
    elsif dice_roll.between?(2, 5)
      @life_points += 50 #+50 hp si ça tombe entre 1 et 5
      @life_points = 100 if @life_points > 100 #peut pas dépasser 100 HP
      puts "Nice catch bro, you found a +50 health pack!"
    else
      @life_points += 80 #+80 hp si ça tombe sur 6
      @life_points = 100 if @life_points > 100
      puts "Wow, you found a +80 health pack, say hello to eternal life!"
    end
  end
end

player1 = Player.new("Lilian")
player2 = Player.new("Maxime")