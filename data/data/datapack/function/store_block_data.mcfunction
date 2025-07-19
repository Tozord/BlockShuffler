# Store the selected block in player's private storage using their UUID
$data modify storage datapack:db players."$(UUID)" set value {}
$data modify storage datapack:db players."$(UUID)".assigned_block set from storage datapack:temp selected_block

# Tell only the player what they rolled
tellraw @s [{"text":"You rolled: ","color":"green"},{"storage":"datapack:temp","nbt":"selected_block","color":"yellow"}] 