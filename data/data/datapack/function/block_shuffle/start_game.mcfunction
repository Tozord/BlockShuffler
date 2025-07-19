# Start the block shuffle game
# Initialize game state if not set
execute unless score #game bs.game_state = #game bs.game_state run scoreboard players set #game bs.game_state 0

# Only allow starting if game is not already active
execute if score #game bs.game_state matches 0 run function datapack:block_shuffle/start_game_confirmed
execute unless score #game bs.game_state matches 0 run tellraw @s [{"text":"Game is already active! Current state: ","color":"red"},{"score":{"name":"#game","objective":"bs.game_state"},"color":"yellow"}]

# Reset trigger
scoreboard players set @s bs.start 0 