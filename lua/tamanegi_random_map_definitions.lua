_ = wesnoth.textdomain "wesnoth-A_Group"

-- random map definitions

function build_map_definition_road()
  local terrain_table = { "Rr", "Re", "Gg", "Gd", "Gg^Fds" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  80,  85,  90,  95, 100 }
  terrain_connection[terrain_table[2]] = {   5,  55,  80,  85, 100 }
  terrain_connection[terrain_table[3]] = {   5,  20,  80,  85, 100 }
  terrain_connection[terrain_table[4]] = {   5,  10,  45,  85, 100 }
  terrain_connection[terrain_table[5]] = {   0,   5,  45,  50, 100 }
  return terrain_table, terrain_connection
end

function build_map_definition_sparse_forest()
  local terrain_table = { "Gg^Fp", "Gll^Fdf", "Gg", "Hh", "Hh^Fp" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  60,  80,  90,  95, 100 }
  terrain_connection[terrain_table[2]] = {  45,  85,  95, 100, 100 }
  terrain_connection[terrain_table[3]] = {  20,  30,  95, 100, 100 }
  terrain_connection[terrain_table[4]] = {  30,  35,  40,  90, 100 }
  terrain_connection[terrain_table[5]] = {   0,   0,   0,  50, 100 }
  return terrain_table, terrain_connection
end

function build_map_definition_sparse_forest_village()
  local terrain_table = { "Gg", "Gll^Fdf", "Gg^Fp", "Gs^Vx", "Hh", "Hh^Fp" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  60,  75,  85,  88,  95, 100 }
  terrain_connection[terrain_table[2]] = {  60,  80,  90,  95, 100, 100 }
  terrain_connection[terrain_table[3]] = {  40,  50,  90,  95, 100, 100 }
  terrain_connection[terrain_table[4]] = {  50,  60,  80,  80,  90, 100 }
  terrain_connection[terrain_table[5]] = {  30,  40,  55,  60,  70, 100 }
  terrain_connection[terrain_table[6]] = {  30,  40,  55,  60,  80, 100 }
  return terrain_table, terrain_connection
end

function build_map_definition_plain_forest()
  local terrain_table = { "Gg", "Rr", "Gg^Fp", "Hh", "Hh^Fp" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  70,  80,  90,  95, 100 }
  terrain_connection[terrain_table[2]] = {  30,  90,  95, 100, 100 }
  terrain_connection[terrain_table[3]] = {  20,  30,  95, 100, 100 }
  terrain_connection[terrain_table[4]] = {  30,  35,  40,  90, 100 }
  terrain_connection[terrain_table[5]] = {   0,   0,   0,  50, 100 }
  return terrain_table, terrain_connection
end

function build_map_definition_city()
  local terrain_table = { "Rrc", "Gg", "Rr^Vxc", "Gs^Vx", "Gs^Fds" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  50,  70,  90, 100, 100 }
  terrain_connection[terrain_table[2]] = {  20,  70,  70,  85, 100 }
  terrain_connection[terrain_table[3]] = {  40,  50,  95, 100, 100 }
  terrain_connection[terrain_table[4]] = {  10,  45,  55,  80, 100 }
  terrain_connection[terrain_table[5]] = {   0,  20,  20,  50, 100 }
  return terrain_table, terrain_connection
end

function build_map_definition_village()
  local terrain_table = { "Gg", "Gd", "Rb", "Rp", "Rb^Vxc", "Gs^Fds" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  40,  60,  70,  80,  85, 100 }
  terrain_connection[terrain_table[2]] = {  20,  50,  80,  90, 100, 100 }
  terrain_connection[terrain_table[3]] = {  10,  30,  75,  85,  95, 100 }
  terrain_connection[terrain_table[4]] = {  10,  15,  25,  75,  95, 100 }
  terrain_connection[terrain_table[5]] = {  30,  60,  65,  85,  85, 100 }
  terrain_connection[terrain_table[6]] = {  40,  50,  60,  65,  70, 100 }
  return terrain_table, terrain_connection
end

function build_map_definition_hills()
  local terrain_table = { "Hh", "Hhd", "Hh^Fms", "Hhd^Fdf", "Gg", "Mm" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  50,  65,  80,  85,  90, 100 }
  terrain_connection[terrain_table[2]] = {  30,  70,  80,  85,  90, 100 }
  terrain_connection[terrain_table[3]] = {  30,  40,  70,  80,  85, 100 }
  terrain_connection[terrain_table[4]] = {  20,  45,  65,  80,  85, 100 }
  terrain_connection[terrain_table[5]] = {  20,  30,  50,  60, 100, 100 }
  terrain_connection[terrain_table[6]] = {  40,  60,  70,  80,  80, 100 }
  return terrain_table, terrain_connection
end

function build_map_definition_deserts()
  local terrain_table = { "Dd", "Rd", "Hd", "Dd^Dox" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  50,  70,  95, 100 }
  terrain_connection[terrain_table[2]] = {  70,  90, 100, 100 }
  terrain_connection[terrain_table[3]] = {  50,  75,  95, 100 }
  terrain_connection[terrain_table[4]] = {  60,  85, 100, 100 }
  return terrain_table, terrain_connection
end

function build_map_definition_deserts_village()
  local terrain_table = { "Dd", "Rd", "Hd", "Dd^Vxd", "Dd^Dox" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  50,  70,  85,  90, 100 }
  terrain_connection[terrain_table[2]] = {  70,  90, 100, 100, 100 }
  terrain_connection[terrain_table[3]] = {  50,  75,  95,  95, 100 }
  terrain_connection[terrain_table[4]] = {  60,  80,  90,  95, 100 }
  terrain_connection[terrain_table[5]] = {  50,  80,  90, 100, 100 }
  return terrain_table, terrain_connection
end

function build_map_definition_swamp()
  local terrain_table = { "Ss", "Sm", "Gg", "Wwf", "Wwg" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  40,  60,  80,  90, 100 }
  terrain_connection[terrain_table[2]] = {  20,  60, 100,  90, 100 }
  terrain_connection[terrain_table[3]] = {  50,  60,  90, 100, 100 }
  terrain_connection[terrain_table[4]] = {  30,  45,  60,  80, 100 }
  terrain_connection[terrain_table[5]] = {  30,  45,  45,  70, 100 }
  return terrain_table, terrain_connection
end

function build_map_definition_river()
  local terrain_table = { "Ww", "Ww^Ewl", "Ww^Ewf", "Wwf", "Ds" }
  local terrain_connection = {}
  terrain_connection[terrain_table[1]] = {  70,  75,  78,  90, 100 }
  terrain_connection[terrain_table[2]] = {  70,  75,  78,  90, 100 }
  terrain_connection[terrain_table[3]] = {  70,  75,  78,  90, 100 }
  terrain_connection[terrain_table[4]] = {  70,  75,  78,  95, 100 }
  terrain_connection[terrain_table[5]] = {  70,  70,  70,  80, 100 }
  return terrain_table, terrain_connection
end

function get_terrain_matrix( map_type )
  if map_type == "ROAD" then
    return build_map_definition_road()
  end

  if map_type == "SPARSE_FOREST" then
    return build_map_definition_sparse_forest()
  end

  if map_type == "SPARSE_FOREST_VILLAGE" then
    return build_map_definition_sparse_forest_village()
  end

  if map_type == "PLAIN_FOREST" then
    return build_map_definition_plain_forest()
  end

  if map_type == "CITY" then
    return build_map_definition_city()
  end

  if map_type == "VILLAGE" then
    return build_map_definition_village()
  end

  if map_type == "HILL" then
    return build_map_definition_hills()
  end

  if map_type == "DESERT" then
    return build_map_definition_deserts()
  end

  if map_type == "DESERT_VILLAGE" then
    return build_map_definition_deserts_village()
  end

  if map_type == "SWAMP" then
    return build_map_definition_swamp()
  end

  if map_type == "RIVER" then
    return build_map_definition_river()
  end

  -- no valid map type found
  return build_map_definition_sparse_road()
end
