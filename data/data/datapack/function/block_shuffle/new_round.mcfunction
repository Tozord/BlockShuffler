# Start a new round
tellraw @a {"text":"=== NEW ROUND STARTING ===","color":"green","bold":true}
tellraw @a [{"text":"Round ","color":"yellow"},{"storage":"datapack:bs","nbt":"game.round","color":"gold"},{"text":" - Find your block!","color":"yellow"}]

# Set game state to active
scoreboard players set #game bs.game_state 2
scoreboard players set #game bs.tens_timer 10
scoreboard players set #game bs.tens_count 30
scoreboard players set #game bs.tick_timer 0

# Reset round data
scoreboard players set @a[gamemode=!spectator] bs.found_block 0

# Assign random blocks to all surviving players
execute as @a[gamemode=!spectator] run function datapack:assign_random_block_to_player

# Show timer
tellraw @a {"text":"You have 5 minutes to find your block!","color":"aqua"}
tellraw @a {"text":"Stand on top of your block to complete the round!","color":"aqua"} 