local function BlockVehicle( ply, veh, _ )
	if ply.IsVehBlocked then
		if CurTime() >= ply.VehBlockedTime then
			ply.IsVehBlocked = false
			return true
		else
			ply:ChatPrint("Du bist noch" .. CurTime() - ply.VehBlockedTime .." Sekunden gebannt.")
			return false
		end
	end
end
hook.Add("CanPlayerEnterVehicle", "VehBlockScript", BlockVehicle)


function ulx.vehblock(ply, targets)
	for _,v in pairs(targets) do
		v.IsVehBlocked = true
		v.VehBlockedTime = CurTime() + 7200
	end

end
local vehblock = ulx.command("Baus Kingski", "ulx vehblock", ulx.vehblock, "!vehblock")
vehblock:addParam({ type=ULib.cmds.PlayersArg })
vehblock:defaultAccess(ULib.ACCESS_SUPERADMIN)
vehblock:help("VehBlock.")