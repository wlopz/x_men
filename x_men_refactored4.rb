# Created by Joseph Ciancio 9/27/2015
# A simple game that has the user select an X-Men and fight against Magneto
require "./x_men_module.rb"
include XMenMethods

begin
# Welcome Message
  puts "Welcome to Professor Xavier's School for Gifted Youngsters!\n\nWe need your help to save the world!"
  letUserRead
  puts "\nYou'll be going up against a villain! \n\nEach round choose one of your character's powers to pulverize the villain."
  letUserRead
  
  character = choosePlayer
  letUserRead

  enemy = chooseEnemy
  letUserRead

  player_health = 100
  enemy_health = 100

# This loop creates the battle
  begin
    puts "\nYour health is now at: #{player_health} and #{enemy.capitalize}'s is at: #{enemy_health}."
    puts "\nYour turn! Choose a power. Options: "
    remindPowers(character)

    attack_choice = gets.chomp.downcase
    letUserRead


    case attack_choice
    when "auto heal"
      player_health = autoHeal(character)
    when "blade blitz", "slash attack"
      if character == "wolverine"
        weak_damage_this_round = randomWeakAttack(enemy_health, player_health)
        enemy_health = weak_damage_this_round[0]
        player_health = weak_damage_this_round[1]
        # puts "\nYou just did #{player_damage_this_round} damage!"
      else 
        puts "\nSorry #{character.capitalize} can't use #{attack_choice}"
      end
    when "lazer beam", "heat ray"
      if character == "cyclops"
        weak_damage_this_round = randomWeakAttack(enemy_health, player_health)
        enemy_health = weak_damage_this_round[0]
        player_health = weak_damage_this_round[1]
      else
        puts "\nSorry #{character.capitalize} can't use #{attack_choice}"
      end
    when "freeze blast", "ice rocket"
      if character == "iceman"
        weak_damage_this_round = randomWeakAttack(enemy_health, player_health)
        enemy_health = weak_damage_this_round[0]
        player_health = weak_damage_this_round[1]
      else
        puts "\nSorry #{character.capitalize} can't use #{attack_choice}"
      end
    when "tornado", "earthquake"
      if character == "storm"
        weak_damage_this_round = randomWeakAttack(enemy_health, player_health)
        enemy_health = weak_damage_this_round[0]
        player_health = weak_damage_this_round[1]
      else
        puts "\nSorry #{character.capitalize} can't use #{attack_choice}"
      end
    when "ultra lazer blast", "snow bomb", "lightning strike"
      strong_damage_this_round = randomStrongAttack(enemy_health, player_health)
      enemy_health = strong_damage_this_round[0]
      player_health = strong_damage_this_round[1]
    else
      puts "\nSorry, #{attack_choice} is not one of #{character.capitalize}'s powers."
    end
    letUserRead
  end until (enemy_health <= 0) || (player_health <= 0)

  finalMessage(enemy_health, player_health)
  restart = playAgain
end until restart == "n"