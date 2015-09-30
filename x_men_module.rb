module XMenMethods
  def letUserRead
    sleep(3.5)
    puts `clear`
  end

  def choosePlayer
    begin
      puts "Please select one of our X-Men to play.\nOptions: Wolverine, Cyclops, Iceman, Storm"
      player_choice = gets.chomp.downcase
      case player_choice
      when "wolverine"
        puts "\nWolverine is a very powerful character. His powers are Auto Heal, Blade Blitz, and Slash Attack."
      when "cyclops"
        puts "\nCyclops is dangerous, be careful! His powers are Lazer Beam, Heat Ray, and Ultra Lazer Blast."
      when "iceman"
        puts "\nIceman....gives me the chills. His powers are Freeze Blast, Ice Rocket, and Snow Bomb."
      when "storm"
        puts "\nGood choice! Storm's powers are Tornado, Earthquake, and Lightning Strike."
      else
        puts "\nSorry you can't choose #{player_choice}! Please choose again."
      end
    end until ["wolverine", "cyclops", "iceman", "storm"].include? player_choice 
    player_choice
  end

  def chooseEnemy
    begin
      puts "Please select an enemy to begin your battle.\nOptions: Magneto, Mystique, Sabertooth, Juggernaut"
      enemy_choice = gets.chomp.downcase
      case enemy_choice
      when "magneto"
        puts "\nYou cannot defeat me. I am the ultimate villain!"
      when "mystique"
        puts "\nBetter watch your back. You won't see me coming..."
      when "sabertooth"
        puts "\nROARRRR. I'm gonna rip your throat out!"
      when "juggernaut"
        puts "\nDon't mess with Juggernaut!"
      else
        puts "\nSorry, #{enemy_choice} is out of town."
      end
    end until ["magneto", "mystique", "sabertooth", "juggernaut"].include? enemy_choice 
    enemy_choice
  end

  def remindPowers(character)
    case character # Reminds users which powers are associated with each player
    when "wolverine"
      puts "Auto Heal, Blade Blitz, and Slash Attack"
    when "cyclops"
      puts "Lazer Beam, Heat Ray, and Ultra Lazer Blast"
    when "iceman"
      puts "Freeze Blast, Ice Rocket, and Snow Bomb"
    when "storm"
      puts "Tornado, Earthquake, and Lightning Strike"
    else
      puts "Why isn't it reading this case? Is it the character variable?"
    end
  end

  def autoHeal(character)
    if character == "wolverine"
      player_health = 100
      puts "\nWolverine is at full health!"
    else
      puts "\nSorry #{character.capitalize} can't use that power."
    end
    player_health
  end

  def randomWeakAttack(enemy_health, player_health, *rest)
    if (rand(10) > 5)
      enemy_health -= rand(10..30)
      puts "You just did some damage!"
    else
      player_health -= rand(10..30)
      puts "You missed and got hit!"
    end
    [enemy_health, player_health]
  end

  def randomStrongAttack(enemy_health, player_health, *rest)
    if (rand(10) > 5)
      enemy_health -= rand(40..60)
      puts "You just did major damage!"
    else
      player_health -= rand(40..60)
      puts "You missed and got smacked!"
    end
    [enemy_health, player_health]
  end

  def finalMessage(enemy_health, player_health)
    if enemy_health <= 0
      puts "\nCongratulations, you won!"
    elsif player_health <= 0
      puts "\nSorry, you were defeated. Try again."
    else puts "\nSomething went wrong."
    end
  end

  def playAgain
    puts "Do you want to play again?\nY or N"
    gets.chomp.downcase
  end
end