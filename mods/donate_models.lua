-- from incredible-gmod.ru with <3
-- https://github.com/Be1zebub/GMD-Mods/blob/master/mods/donate_models.lua
-- источник: https://forum.gm-donate.ru/t/prodazha-donat-modelej/1003/6

local ITEM = FindMetaTable("IGSItem")

function ITEM:SetPlayerModel(path, ...)
	self.PlayerModel = path

	if ... then
		local whitelist = {}
		for _, team in ipairs({...}) do
			whitelist[team] = true
		end
		self.ModelTeamWhitelist = whitelist
	end

	return self
end

hook.Add("PlayerLoadout", "gm-donate.ru/donateModels", function(ply)
	timer.Simple(3, function()
		if IsValid(ply) == false then return end

		for uid, item in ipairs(IGS.PlayerPurchases(ply)) do
			if item.PlayerModel == nil then continue end

			if item.ModelTeamWhitelist == nil or item.ModelTeamWhitelist[ply:Team()] then
				ply:SetModel(item.PlayerModel)
				break
			end
		end
	end)
end)

IGS("Gorgeous Freeman", "custom_model")
:SetDescription("https://forum.gm-donate.ru/t/sozdanie-privyazki-modeli-na-vse-profesii-darkrp/1003/5")
:SetCategory("Разное")
:SetPrice(300)
:SetPerma()
:SetPlayerModel("models/AntoineDelak/playermodels/Gorgeous_Freeman_Underwear_PM.mdl", TEAM_CITIZEN, TEAM_GANG)
