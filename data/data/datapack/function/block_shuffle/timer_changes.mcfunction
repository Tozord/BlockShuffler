# Increment Corresponding Timers
scoreboard players add #game bs.tick_timer 1

execute if score #game bs.tick_timer matches 20.. run scoreboard players remove #game bs.tens_timer 1

execute if score #game bs.tens_timer matches 0 run scoreboard players remove #game bs.tens_count 1


# Check if players are on their blocks
execute as @a[gamemode=!spectator,scores={bs.found_block=0}] run function datapack:block_shuffle/periodic_block_check with entity @s

# Show timer warnings
execute if score #game bs.tens_timer matches 0 run execute if score #game bs.tens_count matches 30 run tellraw @a {"text":"5 minute remaining!","color":"green"}
execute if score #game bs.tens_timer matches 0 run execute if score #game bs.tens_count matches 15 run tellraw @a {"text":"2.5 minute remaining!","color":"yellow"}
execute if score #game bs.tens_timer matches 0 run execute if score #game bs.tens_count matches 6 run tellraw @a {"text":"1 minute remaining!","color":"yellow", "bold":true}
execute if score #game bs.tens_timer matches 0 run execute if score #game bs.tens_count matches 3 run tellraw @a {"text":"30 seconds remaining!","color":"red"}
execute if score #game bs.tens_timer matches 0 run execute if score #game bs.tens_count matches 1 run tellraw @a {"text":"10 seconds remaining!","color":"red","bold":true}

# Reset Tick & Tens Timer
execute if score #game bs.tick_timer matches 20.. run scoreboard players set #game bs.tick_timer 0
execute if score #game bs.tens_timer matches 0 run scoreboard players set #game bs.tens_timer 10



# Check if round should end
execute if score #game bs.tens_count matches 0 run function datapack:block_shuffle/round_timeout
execute if score #game bs.game_state matches 2 run execute if score #game bs.players_alive matches 0..1 run function datapack:block_shuffle/game_winner
execute if score #game bs.game_state matches 2 run execute unless entity @a[gamemode=!spectator,scores={bs.found_block=0}] run function datapack:block_shuffle/round_complete