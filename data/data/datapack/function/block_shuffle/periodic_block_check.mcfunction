# Check if players are on their blocks
$execute run function datapack:block_shuffle/check_player_block with storage datapack:db players."$(UUID)"
$execute run function datapack:block_shuffle/actionbar_title with storage datapack:db players."$(UUID)"