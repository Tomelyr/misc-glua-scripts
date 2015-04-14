local function BlockVehicle( ply, veh, _ )
	if ply.IsVehBlocked then
		if CurTime() >= ply.VehBlockedTime then
			ply.IsVehBlocked = false
			return true
		else
			ply:ChatPrint("Du bist noch" .. math.ceil(CurTime() - ply.VehBlockedTime) .." Sekunden gebannt."
			return false
		end
	end
end
hook.Add("CanPlayerEnterVehicle", "VehBlockScript", BlockVehicle)

gameevent.Listen( "player_disconnect" )
hook.Add( "player_disconnect", "BausVehBlockDC", function( data )
	local steamid = data.networkid
	if data.IsVehBlocked then
		file.Write("vehblocked/" .. steamid, data.VehBlockedTime)
	end
end
gameevent.Listen( "player_connect" )
hook.Add( "player_connect", "BausVehBlockConnect", function( data )
	local steamid = data.networkid
	if file.Exists("vehblocked/" .. steamid, "DATA") then
		local time = file.Read("vehblocked/" .. steamid, "DATA")
		data.IsVehBlocked = time
	end
end

function ulx.vehblock(ply, targets)
	for _,v in pairs(targets) do
		v.IsVehBlocked = true
		v.VehBlockedTime = CurTime() + 7200
		ply:ChatPrint("Vehicle Banned:" ..v:Name())
	end

end
local vehblock = ulx.command("Baus Kingski", "ulx vehblock", ulx.vehblock, "!vehblock")
vehblock:addParam({ type=ULib.cmds.PlayersArg })
vehblock:defaultAccess(ULib.ACCESS_SUPERADMIN)
vehblock:help("VehBlock.")

function ulx.vehunblock(ply, targets)
	for _,v in pairs(targets) do
		v.IsVehBlocked = false
		v.VehBlockedTime = CurTime()
		ply:ChatPrint("Vehicle Unbanned:" ..v:Name())
	end

end
local vehunblock = ulx.command("Baus Kingski", "ulx vehunblock", ulx.vehunblock, "!vehunblock")
vehunblock:addParam({ type=ULib.cmds.PlayersArg })
vehunblock:defaultAccess(ULib.ACCESS_SUPERADMIN)
vehunblock:help("VehUnBlock.")
