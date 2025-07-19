# Assign a random block to the current player (called by trigger system)
execute store result score #temp random_block run random value 0..1090

# Select the block based on random number
function datapack:select_block

# Store the block in player's data using UUID and output to chat
function datapack:store_block_data with entity @s