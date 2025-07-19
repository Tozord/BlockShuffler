# This function runs every tick

# Handle original random block trigger
execute as @a[scores={random_block=1..}] run function datapack:assign_random_block

# Handle block shuffle game triggers
execute as @a[scores={bs.start=1..}] run function datapack:block_shuffle/start_game
execute as @a[scores={bs.end=1..}] run function datapack:block_shuffle/end_game
execute as @a[scores={bs.settings=1..}] run function datapack:block_shuffle/settings

# Game logic based on state
execute if score #game bs.game_state matches 2 run function datapack:block_shuffle/timer_changes
execute if score #game bs.game_state matches 1 run function datapack:block_shuffle/countdown



# Enable triggers every tick so players can re-use them
scoreboard players enable @a random_block
scoreboard players enable @a bs.start
scoreboard players enable @a bs.end
scoreboard players enable @a bs.settings