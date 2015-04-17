if not SERVER then return end
local function NewDropDosh( ply, wep, killer )
	local amount = 20 -- you can change the value here. If you wanna you can also do things like 10% of the ply wallet and stuff
	if not ply:canAfford(amount) then --Check if he got the dosh
		amount = 0 -- If not, then the fee will be 0
	end
	if amount > 0 then -- Check if the Dosh got reduced to 0, if not then we gonna do it as normal.
		ply:addMoney(-amount)
		DarkRP.createMoneyBag(ply:GetPos(), amount)
	end
end

hook.Add("PlayerDeath", "DoshDoshDoshDosh", NewDropDosh)
 