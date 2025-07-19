# Actually end the game
tellraw @a {"text":"=== BLOCK SHUFFLE GAME ENDED ===","color":"red","bold":true}
tellraw @a {"text":"Game has been manually ended.","color":"gray"}

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