# All players found their blocks - round complete!
tellraw @a {"text":"=== ROUND COMPLETE ===","color":"green","bold":true}
tellraw @a {"text":"All players found their blocks! Starting next round...","color":"yellow"}
scoreboard players set #game bs.game_state 3

# Double check the No. of Players
execute store result score #game bs.players_alive run execute if entity @a[gamemode=!spectator]

# Check if there's only one player left (winner)
execute if score #game bs.players_alive matches 2.. run function datapack:block_shuffle/prepare_next_round
execute unless score #game bs.players_alive matches 2.. run function datapack:block_shuffle/game_winner