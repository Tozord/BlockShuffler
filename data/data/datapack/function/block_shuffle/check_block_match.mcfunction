# Check if player is standing on their assigned block

# Compare blocks directly (both have minecraft: prefix)
execute store success score #match bs.game_state run data modify storage datapack:db players."$(UUID)".assigned_block set from storage datapack:db players."$(UUID)".current_block
tellraw @s [{"text":"block found status: "}, {"score":{"name":"#game","objective":"bs.game_state"},"color":"yellow"}]
execute if score #match bs.game_state matches 1 run function datapack:block_shuffle/player_found_block