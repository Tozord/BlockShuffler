# Eliminate player from the game
scoreboard players set @s bs.eliminated 1
gamemode spectator @s
tellraw @s {"text":"You have been eliminated! You didn't find your block in time.","color":"red","bold":true}
tellraw @a[gamemode=!spectator] [{"selector":"@s","color":"red"},{"text":" has been eliminated!","color":"yellow"}] 