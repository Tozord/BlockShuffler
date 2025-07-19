# Handle countdown timer
scoreboard players remove #game bs.countdown 1

# Show countdown every second (20 ticks)
execute if score #game bs.countdown matches 80 run tellraw @a {"text":"4","color":"yellow","bold":true}
execute if score #game bs.countdown matches 60 run tellraw @a {"text":"3","color":"yellow","bold":true}
execute if score #game bs.countdown matches 40 run tellraw @a {"text":"2","color":"yellow","bold":true}
execute if score #game bs.countdown matches 20 run tellraw @a {"text":"1","color":"yellow","bold":true}

# Start the game when countdown reaches 0
execute if score #game bs.countdown matches 0 run function datapack:block_shuffle/new_round