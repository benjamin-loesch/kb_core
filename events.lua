local function OnPlayerConnection(name, setKickReason, deferrals)
  local player = source
  local steamIdentifier
  local identifiers = GetPlayerIdentifiers(player)
  deferrals.defer()

  Wait(0)

  deferrals.update(string.format("Hello %s. Your steam ID is being checked.", name))

  for _, v in pairs(identifiers) do
    if string.find(v, "steam") then
      steamIdentifier = v
      break
    end
  end

  Wait(0)

  if not steamIdentifier then
    deferrals.done("You are not connected to Steam.")
  else
    deferrals.done()
  end
end

AddEventHandler("playerConnecting", OnPlayerConnection)