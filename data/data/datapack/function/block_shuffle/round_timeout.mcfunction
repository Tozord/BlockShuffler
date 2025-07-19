# Round timed out - eliminate players who didn't find their block
tellraw @a {"text":"=== TIME'S UP! ===","color":"red","bold":true}

# Eliminate players who didn't find their block and recount No. of Players
execute as @a[gamemode=!spectator,scores={bs.found_block=0}] run function datapack:block_shuffle/eliminate_player
execute store result score #game bs.players_alive run execute if entity @a[gamemode=!spectator]

# Check if game should continue
execute if score #game bs.players_alive matches 2.. run function datapack:block_shuffle/prepare_next_round
execute unless score #game bs.players_alive matches 2.. run function datapack:block_shuffle/game_winner