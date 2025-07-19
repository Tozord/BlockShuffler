import json
from pathlib import Path

# Path to the JSON file containing block IDs.
DATA_JSON = Path("data.json")

# Output path for the generated function file.
OUTPUT_FILE = Path("data/datapack/function/select_block.mcfunction")

# Filter out blocks that are impossible to obtain in survival (exception: keep bedrock)
EXCLUDE_BLOCKS = {
    "air", "cave_air", "void_air", "barrier", "light", "command_block",
    "chain_command_block", "repeating_command_block", "structure_block", "jigsaw",
    "structure_void", "end_portal", "end_portal_frame", "end_gateway", "amethyst_cluster",
    "ancient_debris", "attached_melon_stem", "attached_pumpkin_stem",
    "beacon", "big_dripleaf_stem", "black_shulker_box", "blue_shulker_box",
    "brown_shulker_box", "calibrated_sculk_sensor", "chorus_flower", "chorus_plant",
    "conduit", "creeper_head", "creeper_wall_head", "cyan_shulker_box",
    "deepslate_coal_ore", "diamond_ore", "dragon_egg", "dragon_head", "dragon_wall_head", "end_rod",
    "end_stone", "end_stone_brick_slab", "end_stone_brick_stairs", "end_stone_brick_wall", "end_stone_bricks",
    "exposed_chiseled_copper", "exposed_copper", "exposed_copper_bulb", "exposed_copper_door", "exposed_copper_grate",
    "exposed_copper_trapdoor", "exposed_cut_copper", "exposed_cut_copper_slab", "exposed_cut_copper_stairs",
    "frosted_ice", "gray_shulker_box", "green_shulker_box", "hanging_roots", "heavy_core", "honey_block", "infested_chiseled_stone_bricks",
    "infested_cobblestone", "infested_cracked_stone_bricks", "infested_deepslate", "infested_mossy_stone_bricks",
    "infested_stone", "infested_stone_bricks", "large_amethyst_bud", "light_blue_shulker_box", "light_gray_shulker_box",
    "lime_shulker_box", "magenta_shulker_box", "medium_amethyst_bud", "moving_piston", "nether_portal", "netherite_block",
    "ochre_froglight", "orange_shulker_box", "oxidized_chiseled_copper", "oxidized_copper", "oxidized_copper_bulb",
    "oxidized_copper_door", "oxidized_copper_grate", "oxidized_copper_trapdoor", "oxidized_cut_copper", "oxidized_cut_copper_slab",
    "oxidized_cut_copper_stairs", "pearlescent_froglight", "petrified_oak_slab", "piglin_head", "piglin_wall_head",
    "pink_shulker_box", "piston_head", "pitcher_crop", "pitcher_plant", "player_head", "player_wall_head", "potted_acacia_sapling",
    "potted_allium", "potted_azalea_bush", "potted_azure_bluet", "potted_bamboo", "potted_birch_sapling", "potted_blue_orchid",
    "potted_brown_mushroom", "potted_cactus", "potted_cherry_sapling", "potted_closed_eyeblossom", "potted_cornflower",
    "potted_crimson_fungus", "potted_crimson_roots", "potted_dandelion", "potted_dark_oak_sapling", "potted_dead_bush", "potted_fern",
    "potted_flowering_azalea_bush", "potted_jungle_sapling", "potted_lily_of_the_valley", "potted_mangrove_propagule",
    "potted_oak_sapling", "potted_open_eyeblossom", "potted_orange_tulip", "potted_oxeye_daisy", "potted_pale_oak_sapling",
    "potted_pink_tulip", "potted_poppy", "potted_red_mushroom", "potted_red_tulip", "potted_spruce_sapling", "potted_torchflower",
    "potted_warped_fungus", "potted_warped_roots", "potted_white_tulip", "potted_wither_rose", "purple_shulker_box",
    "purpur_block", "purpur_pillar", "purpurslab", "purpur_stairs", "red_shulker_box", "respawn_anchor", "shulker_box",
    "skeleton_skull", "skeleton_wall_skull", "slime_block", "small_amethyst_bud", "sniffer_egg", "spawner", "spore_blossom",
    "test_block", "test_instance_block", "torchflower", "torchflower_crop", "trial_spawner", "vault", "verdant_froglight",
    "waxed_exposed_chiseled_copper", "waxed_exposed_copper", "waxed_exposed_copper_bulb", "waxed_exposed_copper_door", "waxed_exposed_copper_grate", "waxed_exposed_copper_trapdoor",
    "waxed_exposed_cut_copper", "waxed_exposed_cut_copper_slab", "waxed_exposed_cut_copper_stairs", "waxed_oxidized_chiseled_copper", "waxed_oxidized_copper", "waxed_oxidized_copper_bulb", "waxed_oxidized_copper_door",
    "waxed_oxidized_copper_grate", "waxed_oxidized_copper_trapdoor", "waxed_oxidized_cut_copper", "waxed_oxidized_cut_copper_slab", "waxed_oxidized_cut_copper_stairs", "waxed_weathered_chiseled_copper", "waxed_weathered_copper",
    "waxed_weathered_copper_bulb", "waxed_weathered_copper_door", "waxed_weathered_copper_grate", "waxed_weathered_copper_trapdoor", "waxed_weathered_cut_copper",
    "waxed_weathered_cut_copper_slab", "waxed_weathered_cut_copper_stairs", "weathered_chiseled_copper", "weathered_copper", "weathered_copper_bulb",
    "weathered_copper_door","weathered_copper_grate","weathered_copper_trapdoor","weathered_cut_copper","weathered_cut_copper_slab",
    "weathered_cut_copper_stairs", "white_shulker_box", "wither_rose", "wither_skeleton_skull", "wither_skeleton_wall_skull",
    "yellow_shulker_box", "zombie_head", "zombie_wall_head"
}


def main():
    if not DATA_JSON.exists():
        raise FileNotFoundError(f"{DATA_JSON} not found. Make sure the file exists and contains the block list.")

    # Load block IDs. Expecting either a list of strings or an object with a `blocks` key.
    data = json.loads(DATA_JSON.read_text())
    if isinstance(data, list):
        blocks = data
    elif isinstance(data, dict) and "blocks" in data:
        blocks = data["blocks"]
    else:
        raise ValueError("Unable to parse block list. Expected JSON array or object with 'blocks' key.")

    # Remove excluded blocks but keep bedrock even though it's unobtainable
    blocks = [b for b in blocks if b not in EXCLUDE_BLOCKS]

    # Sort and deduplicate just in case.
    blocks = sorted(set(blocks))

    total_blocks = len(blocks)

    # Generate select_block.mcfunction lines (same as before)
    lines = []
    lines.append("# Automatically generated by generate_select_block.py")
    lines.append("# DO NOT EDIT MANUALLY - run the script again if you need to refresh the list")
    lines.append(f"# Total blocks: {total_blocks}")
    lines.append("# Note: Excluded impossible-to-obtain blocks: " + ", ".join(sorted(EXCLUDE_BLOCKS)))
    lines.append("# Initializes the selected block to stone by default")
    lines.append("data modify storage datapack:temp selected_block set value \"minecraft:stone\"")
    lines.append("")

    for idx, block in enumerate(blocks):
        lines.append(
            f"execute if score #temp random_block matches {idx} run data modify storage datapack:temp selected_block set value \"minecraft:{block}\""
        )

    # Ensure output directory exists.
    OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)

    # Write to file.
    OUTPUT_FILE.write_text("\n".join(lines))

    # Update the random range in assign_random_block.mcfunction automatically
    assign_path = Path("data/datapack/function/assign_random_block.mcfunction")
    if assign_path.exists():
        assign_lines = assign_path.read_text().split("\n")
        new_range_line = f"execute store result score #temp random_block run random value 0..{total_blocks - 1}"
        assign_lines = [
            new_range_line if l.strip().startswith("execute store result score #temp random_block") or l.strip().startswith("execute store result score @s rand") else l
            for l in assign_lines
        ]
        assign_path.write_text("\n".join(assign_lines))

    print(f"Generated {OUTPUT_FILE} with {total_blocks} blocks after filtering.")
    print("Updated random range in assign_random_block.mcfunction to 0..%d" % (total_blocks - 1))
    print("Excluded blocks (kept out):", ", ".join(sorted(EXCLUDE_BLOCKS)))


if __name__ == "__main__":
    main() 