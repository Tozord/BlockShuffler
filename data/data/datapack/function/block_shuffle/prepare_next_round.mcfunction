# Prepare for next round
# Increment round counter
execute store result score #temp_round bs.game_state run data get storage datapack:bs game.round
scoreboard players add #temp_round bs.game_state 1
execute store result storage datapack:bs game.round int 1 run scoreboard players get #temp_round bs.game_state

# Brief pause before next round
tellraw @a {"text":"Next round starts in 5 seconds...","color":"gray"}

scoreboard players set #game bs.game_state 1
scoreboard players set #game bs.countdown 100