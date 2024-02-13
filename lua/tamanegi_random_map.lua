local helper = wesnoth.require "lua/helper.lua"
local mapdef = wesnoth.require "~add-ons/Raiders_of_the_Steppe/lua/tamanegi_random_map_definitions.lua"
_ = wesnoth.textdomain "wesnoth-A_Group"

-- Terrain major and minor codes
--                                     \/: direction of bridge
--    A: frozen                         a: ?
--    B: bridge                         b: ?
--    C: castle                         c: city
--    D: Desert                         d: dry or desert
--    E: Embellishment                  e: encampment
--    F: forest                         f: flowers, fall
--    G: grass                          g: ?
--    H: hills                          h: human
--    I: interior (not available now?)  i: ice
--    J: ?                              j: ?
--    K: keep                           k: ?
--    L: ?                              l: lava
--    M: mountains                      m: mixed
--    N: ?                              n: ?
--    O: ?                              o: orc
--    P: ?                              p: pine
--    Q: unwalkable                     q: ?
--    R: road                           r: ?
--    S: swamp                          s: simple
--    T: ?                              t: ?
--    U: underground                    u: underground
--    V: village                        v: elvish
--    W: water                          w: ?
--    X: impassable                     x: chasm
--    Y: (for umc)                      y: (for umc)
--    Z: (for umc)                      z: (for umc)
--    _: system

function wesnoth.wml_actions.tamanegi_create_random_map(cfg)
  local options = {}
  if cfg.variable then
    options.var_map = cfg.variable
  else
    error("[tamanegi_create_random_map] requires variable= attribute.")
  end

  if cfg.x then options.x = cfg.x end
  if cfg.y then options.y = cfg.y end
  if cfg.type then options.map_type = cfg.type end
  if cfg.num_init then options.num_seeds = cfg.num_init end

  tamanegi_create_random_map(options)
end

function tamanegi_create_random_map( options )
  -- var_map(out)  : container for the map string
  -- x(in)         : map size for x direction (excluding border)
  -- y(in)         : map size for y direction (excluding border)
  -- map_type(in)  : map type
  -- num_seeds(in) : number of predefined terrain

  -- default params
  local size_x = 25
  local size_y = 20
  local num_seeds = 8
  local var_map = "tmp_map_random"
  local map_type = "SPARSE_FOREST"

  -- parse options
  if options.x then
    size_x = options.x
  end
  if options.y then
    size_y = options.y
  end
  if options.num_seeds then
    num_seeds = options.num_seeds
  end
  if options.map_type then
    map_type = options.map_type
  end
  if options.var_map then
    var_map = options.var_map
  end

  function build_terrain_candidate( md, i, j, tt, tc )
    local ret = {}
    local count = 0
    for mm = 1, #tt do
      ret[mm] = 0
    end
    for m = -1, 1 do
      local mi = i + m
      if mi >= 1 and mi <= #md then
        for n = -1, 1 do
          local ni = j + n
          if ni >= 1 and ni <= #md[i] then
            if ( m ~= 0 or n ~= 0 ) and md[mi][ni] ~= "" then
              if tc[md[mi][ni]] ~= nil then
                for mm = 1, #tt do
                  ret[mm] = ret[mm] + tc[md[mi][ni]][mm]
                end
                count = count + 1
              end
            end
          end
        end
      end
    end
    if count > 1 then
      for mm = 1, #tt do
        ret[mm] = ret[mm] / count
      end
    end
    return ret
  end

  local border = 1

  -- read argument variables
  local create_size_x = size_x + 2 * border
  local create_size_y = size_y + 2 * border

  local terrains
  local connections
  terrains,connections = get_terrain_matrix( map_type )

  -- initialize map
  local map = {}
  for i = 1, create_size_y do
    map[i] = {}
    for j = 1, create_size_x do
      map[i][j] = ""
    end
  end

  -- process seeds
  map[1][1] = terrains[1]
  for i = 1, num_seeds do
    local rx_arg = string.format( "1..%u", create_size_x )
    local ry_arg = string.format( "1..%u", create_size_y )
    local rx = helper.rand( rx_arg )
    local ry = helper.rand( ry_arg )
    map[ry][rx] = terrains[1]
  end

  -- first iteration
  for i = 1, #map do
    for j = 1, #map[i] do
      if map[i][j] == "" then
        local cand = build_terrain_candidate( map, i, j, terrains, connections )
        local c = 1
        local r = helper.rand( "0..99" )
        while r > cand[c] do
          c = c + 1
        end
        map[i][j] = terrains[c]
      end
    end
  end

  -- second iteration?

  -- output map
  local map_text = ""
  for i = 1, #map do
    for j = 1, #map[i] do
      if j ~= 1 then
        map_text = map_text .. ", "
      end
      map_text = map_text .. map[i][j]
    end
    map_text = map_text .. "\n"
  end
  --print( map_text )
  wml.variables[ var_map ] = map_text

end
