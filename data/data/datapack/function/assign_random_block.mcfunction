# When anyone triggers random_block, assign blocks to ALL players
tellraw @s {"text":"Assigning random blocks to all players...","color":"yellow"}

# Loop through all online players and assign them each a random block
execute as @a run function datapack:assign_random_block_to_player

# Tell the triggering player how many players were processed
tellraw @s [{"text":"Random blocks assigned to ","color":"green"},{"selector":"@a","color":"yellow"},{"text":"!","color":"green"}]

# Reset trigger and re-enable
scoreboard players set @s random_block 0
scoreboard players enable @s random_block 