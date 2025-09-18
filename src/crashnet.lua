local orig = NetworkMatchMakingEPIC.is_server_ok

local default_numbers = { 30049, 0, 1, 1, 0, 1, 0, 1, nil, 0 }
local defaults = {
  owner_level = 0,
  one_down = 0,
  allow_mods = 1,
  crime_spree = -1,
  skirmish = 0,
}

function NetworkMatchMakingEPIC:is_server_ok(fo, room, attributes, invite)
  local bully = false

  for k, v in pairs(attributes) do
    if v == -2000 then
      if not bully then
        bully = true
        room.owner_name = "BULLY ME " .. room.owner_name
      end
      attributes[k] = defaults[k]
    end
  end
  for k, v in pairs(attributes.numbers) do
    if v == -2000 then
      if not bully then
        bully = true
        room.owner_name = "BULLY ME " .. room.owner_name
      end
      attributes.numbers[k] = default_numbers[k]
    end
  end

  return orig(self, fo, room, attributes, invite)
end
