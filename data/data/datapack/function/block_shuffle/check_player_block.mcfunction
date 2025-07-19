# Check if player is standing on their assigned block
$execute at @s if block ~ ~-1 ~ $(assigned_block) run function datapack:block_shuffle/player_found_block