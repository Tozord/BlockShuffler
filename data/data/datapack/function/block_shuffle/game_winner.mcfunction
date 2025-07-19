# Game has a winner!
tellraw @a {"text":"=== GAME OVER ===","color":"gold","bold":true}
execute as @a[gamemode=!spectator] run tellraw @a [{"text":"🏆 WINNER: ","color":"gold","bold":true},{"selector":"@s","color":"yellow","bold":true},{"text":" 🏆","color":"gold","bold":true}]

# Reset game state
scoreboard players set #game bs.game_state 0
scoreboard players set #game bs.countdown 0
scoreboard players set #game bs.tens_timer 0
scoreboard players set #game bs.tens_count 0

# Reset all players
scoreboard players set @a bs.found_block 0
scoreboard players set @a bs.eliminated 0
gamemode survival @a

# Clear game data
data modify storage datapack:bs game set value {state:"stopped",round:0,players_alive:0} 