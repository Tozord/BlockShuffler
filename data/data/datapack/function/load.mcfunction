# This function runs when the datapack is loaded
tellraw @a {"text":"Random Block Assignment Datapack loaded!","color":"green"}

# Set up the original trigger scoreboard
scoreboard objectives add random_block trigger {"text":"Get Random Block"}

# Set up block shuffle game scoreboards
scoreboard objectives add bs.start trigger {"text":"Start Block Shuffle"}
scoreboard objectives add bs.end trigger {"text":"End Block Shuffle"}
scoreboard objectives add bs.settings trigger {"text":"Block Shuffle Settings"}

# Game state scoreboards
scoreboard objectives add bs.game_state dummy {"text":"Game State"}
scoreboard objectives add bs.countdown dummy {"text":"Countdown Timer"}
scoreboard objectives add bs.round_timer dummy {"text":"Round Timer"}
scoreboard objectives add bs.found_block dummy {"text":"Found Block"}
scoreboard objectives add bs.eliminated dummy {"text":"Eliminated"}
scoreboard objectives add bs.tick_timer dummy {"text":"Tick Timer"}
scoreboard objectives add bs.tens_count dummy {"text":"Tens Counter"}
scoreboard objectives add bs.tens_timer dummy {"text":"Tens Timer"}
scoreboard objectives add bs.players_alive dummy {"text":"Players Alive"}

# Enable triggers for all players
scoreboard players enable @a random_block
scoreboard players enable @a bs.start
scoreboard players enable @a bs.end
scoreboard players enable @a bs.settings

# Initialise storage
data modify storage datapack:db players set value {}
data modify storage datapack:bs game set value {state:"stopped",round:0,players_alive:0}

# Game states: 0=stopped, 1=countdown, 2=active, 3=new_round, 4=ended
scoreboard players set #game bs.game_state 0

#set tick_timer to default value
scoreboard players set #game bs.tick_timer 0

tellraw @a {"text":"Use '/trigger random_block' to assign random blocks to ALL players!","color":"aqua"}
tellraw @a {"text":"Block Shuffle Game Commands:","color":"gold"}
tellraw @a {"text":"  /trigger bs.start - Start the game","color":"yellow"}
tellraw @a {"text":"  /trigger bs.end - End the game","color":"yellow"} 