# Random Block Assignment Datapack

A simple Minecraft datapack that assigns random blocks to players using a trigger command and stores them using UUIDs.

## Features

- **Random Block Assignment**: Players get assigned a random block from 50 different blocks
- **UUID Storage**: Each player's assigned block is stored using their UUID as the key
- **Simple Trigger**: Uses `/trigger random_block` for easy access
- **Always Replaces**: New assignments replace previous ones

## Commands

### For Players:
- `/trigger random_block` - Get assigned a random block (replaces any existing assignment)

### For Testing:
- `/function datapack:test` - Test the random block assignment

## How It Works

1. Player runs `/trigger random_block`
2. System generates random number (0-49) to select from 50 blocks
3. Selected block is stored in `storage datapack:db players."<UUID>"`
4. Player sees their assigned block in chat
5. Any previous assignment is replaced

## Block List

The datapack includes 50 different blocks:
- Stone, Cobblestone, Wood types (Oak, Birch, Spruce, etc.)
- Ores (Iron, Gold, Diamond, Emerald, etc.)
- Wool colors (White, Red, Blue, Green, etc.)
- Special blocks (Obsidian, Ancient Debris, Glowstone, etc.)
- Building blocks (Bricks, Sandstone, Prismarine, etc.)
- Ice types and more!

## Installation

1. Copy this folder to your world's datapacks directory:
   `%appdata%\.minecraft\saves\[world_name]\datapacks\`
2. Use `/reload` in-game or restart your world
3. Use `/trigger random_block` to get your random block!

## Technical Details

- **Pack Format**: 81 (Minecraft Java 1.21.7)
- **Storage**: `datapack:db players."<UUID>".assigned_block`
- **Trigger**: `random_block` scoreboard objective
- **UUID-based**: Uses player UUIDs as keys for efficient storage

## File Structure

```
├── pack.mcmeta
├── README.md
└── data/
    ├── datapack/function/
    │   ├── assign_random_block.mcfunction (main logic)
    │   ├── load.mcfunction (initialization)
    │   ├── select_block.mcfunction (50 block selection)
    │   ├── store_block_data.mcfunction (UUID storage)
    │   ├── test.mcfunction (testing)
    │   └── tick.mcfunction (trigger detection)
    └── minecraft/tags/function/
        ├── load.json (run on load)
        └── tick.json (run every tick)
``` 