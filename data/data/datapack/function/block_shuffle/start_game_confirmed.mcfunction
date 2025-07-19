# Actually start the game
tellraw @a {"text":"=== BLOCK SHUFFLE GAME STARTING ===","color":"gold","bold":true}
tellraw @a {"text":"Get ready! Game starts in 5 seconds...","color":"yellow"}

# Set game state to countdown
scoreboard players set #game bs.game_state 1
scoreboard players set #game bs.countdown 100

# Reset all players
scoreboard players set @a bs.found_block 0
scoreboard players set @a bs.eliminated 0
gamemode survival @a

# Initialize game data
data modify storage datapack:bs game.round set value 1
execute store result score #game bs.players_alive run execute if entity @a[gamemode=!spectator]