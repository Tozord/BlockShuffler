# Get player's assigned block from storage and check position
$data modify storage datapack:temp selected_block set from storage datapack:db players."$(UUID)".assigned_block

# Store the block below the player (gets the block ID)
$data modify storage datapack:db players."$(UUID)".current_block_data set from block ~ ~-1 ~
$data modify storage datapack:db players."$(UUID)".current_block from storage datapack:db players."$(UUID)".current_block_data.Name

# Check if we have a block assigned
execute if data storage datapack:temp selected_block run function datapack:block_shuffle/check_block_match with entity @s