# Create full block name and compare
data modify storage datapack:temp selected_block_full set value "minecraft:$(selected_block)"

# Compare the blocks
execute store success score #match bs.game_state run data modify storage datapack:temp selected_block_full set from storage datapack:temp current_block
execute if score #match bs.game_state matches 0 run function datapack:block_shuffle/player_found_block