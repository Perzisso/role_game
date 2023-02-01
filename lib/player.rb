class Player
  attr_accessor :name, :life_points

  # Entrer le nom en initialise
  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points <= 0
      puts "#{@name} a 0 points de vie"
    else
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
      if @life_points <= 0
        puts "#{@name} a été tué"
      else
        puts "Il reste #{@life_points} points de vie à #{@name}"
      end
  end

  def attacks(attackted_player)
    puts "#{@name} attaque #{attackted_player.name}"
    damage_received = compute_damage
    puts "#{@name} lui inflige #{damage_received} point(s) de dommage"
    attackted_player.gets_damage(damage_received)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialise(name, weapon_level)
    @weapon_level = 1

    super(name)
    @life_points = 100
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    level = rand(1..6)
    if level > @weapon_level
      puts "Génial, cette arme est mieux, tu l'as garde !"
      @weapon_level = level
    else
      puts "Ah mince, cette arme est trop naze, tu l'as laisse !"
    end
    puts "Tu as trouvé une arme de niveau #{@weapon_level}"
  end

  def search_health_pack
  end


end
