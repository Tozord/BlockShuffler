# Player found their block!
scoreboard players set @s bs.found_block 1
tellraw @s {"text":"✓ You found your block! You're safe this round!","color":"green","bold":true}
tellraw @a[gamemode=!spectator] [{"selector":"@s","color":"green"},{"text":" found their block!","color":"yellow"}] 