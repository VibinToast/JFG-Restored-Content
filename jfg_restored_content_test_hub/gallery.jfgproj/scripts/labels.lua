-- Room names: shown when you arrive in a room, and in the hub when you walk up to a door.

local ROOMS = {
  level_e_0xe6 = "0xE6: Water Boss",
  level_e_0x166 = "0x166: burrowing worm",
  level_e_0x1e5 = "0x1E5: alien",
  level_e_0x83 = "0x83: flying ant",
  level_e_0xf1 = "0xF1: heavy brute",
  level_e_0x2a = "0x2A: flying bug",
  level_e_0x153 = "0x153: horned flyer",
  level_e_0xe0 = "0xE0: insect",
  level_e_0xdf = "0xDF: lava creature",
  level_e_0xf2 = "0xF2: flying insect",
  level_e_0xf6 = "0xF6: rocket turret (shoot its top)",
  level_e_0x68 = "0x68: ant vehicle (a prop: no AI)",
  level_p_0x17b = "0x17B: bomb pad (refuels), beside a stock refuel pad",
  level_p_0x283 = "0x283: tank (solid)",
  level_p_0x47 = "0x47: hoverboard (rides a loop)",
  level_e_0xea = "0xEA: Mr Pants. The model the 'ants as Mr Pants' cheat gives every ant, here an enemy of his own: he fights as a blue ant",
  level_p_0x6e = "0x6E: butterflies (they chase you when you come near), and two frogs (a stand-in model: no frog model survives). Left one squashes, right one vanishes",
  level_p_hints = "Hint mole (left, the magazine trade) and hint limpet (right, no lines of its own)",
  level_p_targets = "Timed target (right: shows after 3 s for 10 s, once) and a no-gravity column (left)",
  level_p_pickups = "Unused pickups: the 5 key colours the game never uses (light blue, lime, purple, tango, lemon), machine gun + ammo clip, blueprints, invincibility, invisibility, magazine, proximity mine",
  level_p_props = "Unused props: floating ship parts, mine key and crowbar; urn, alien pod and crate (shoot them); bouncy bridge",
  level_p_lights = "Unused lights: spinning lights, a window light, a light show (right), and lock lights by a lime key door (the unused lime key is behind you)",
  level_e_heroes = "Hero bodies: Juno as the Tribal man (0x4), Vela as the yellow ant (0x21). Multiplayer bodies (totem poles unlock them), here in single player",
  level_p_paths = "Path props: the lift car on a path, the logo and the drone generator",
}

-- The hub's doors: x, z of each doorway and what it leads to (the hub's layout: 12 a side and one more on the north, 300 apart).
local DOORS = {}
local NORTH = { "level_e_0xe6", "level_e_0x166", "level_e_0x1e5", "level_e_0x83", "level_e_0xf1", "level_e_0x2a",
                "level_e_0x153", "level_e_0xe0", "level_e_0xea", "level_p_0x6e", "level_p_hints", "level_p_targets", "level_e_heroes" }
local SOUTH = { "exit", "level_e_0xdf", "level_e_0xf2", "level_e_0xf6", "level_e_0x68", "level_p_0x17b",
                "level_p_0x283", "level_p_0x47", "level_p_pickups", "level_p_props", "level_p_lights", "level_p_paths" }
for i = 1, 13 do
  local x = -1050 + 300 * (i - 1)
  DOORS[#DOORS + 1] = { x = x, z = -300, name = NORTH[i] }
  if SOUTH[i] then DOORS[#DOORS + 1] = { x = x, z = 300, name = SOUTH[i] } end
end

local ids = {}   -- level number -> room name, filled on the first level event (numbers are given out at start)
local hub = nil
local shown = nil

local function learn_ids()
  if hub ~= nil then return end
  hub = jfg.level_id("level_hub")
  for name, text in pairs(ROOMS) do
    local n = jfg.level_id(name)
    if n ~= nil then ids[n] = text end
  end
end

jfg.on("level", function(level)
  learn_ids()
  shown = nil
  if level == hub then
    jfg.message("Restored Content Gallery: walk up to a door to see what is behind it", 5)
  elseif ids[level] ~= nil then
    jfg.message(ids[level], 5)
  end
end)

jfg.on("tick", function(level, seconds)
  if level ~= hub then return end
  local x, y, z = jfg.player()
  if x == nil then return end
  local near = nil
  for _, d in ipairs(DOORS) do
    if math.abs(x - d.x) < 110 and math.abs(z - d.z) < 140 then near = d.name end
  end
  if near ~= nil and near ~= shown then
    jfg.message(near == "exit" and "Back to the game" or ROOMS[near], 3)
  end
  shown = near
end)
