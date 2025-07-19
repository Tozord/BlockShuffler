# End the block shuffle game
execute if score #game bs.game_state matches 1..2 run function datapack:block_shuffle/end_game_confirmed
execute if score #game bs.game_state matches 0 run tellraw @s {"text":"No game is currently active!","color":"red"}

# Reset trigger
scoreboard players set @s bs.end 0 