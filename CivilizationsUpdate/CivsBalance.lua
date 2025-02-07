function HasCivilizationTrait(civilizationType, traitType)
	for row in GameInfo.CivilizationTraits() do
		if (row.CivilizationType == civilizationType and row.TraitType == traitType) then
			return true;
		end
	end
	return false;
end







--Phoenicia
local WRITING_PROGRESS = 0;
local WRITING_INDEX = GameInfo.Technologies['TECH_WRITING'].Index;
function PhoeniciaWitingOnMeet (player1Id)
	local player = Players[player1Id];
	local playerConfig = PlayerConfigurations[player1Id];
	local civilization = playerConfig:GetCivilizationTypeName();
	if HasCivilizationTrait(civilization, 'TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES') then
		WRITING_PROGRESS = WRITING_PROGRESS + 1
		if WRITING_PROGRESS == 2 then
			if not player:GetTechs():HasTech(WRITING_INDEX) then
				local cost = player:GetTechs():GetResearchCost(WRITING_INDEX);
				player:GetTechs():SetResearchProgress(WRITING_INDEX, cost);
			end
		end
	end
end
Events.DiplomacyMeetMajors.Add(PhoeniciaWitingOnMeet);

--Netherlands (copy from HD)
local EXPLORATION_INDEX = GameInfo.Civics['CIVIC_EXPLORATION'].Index;
function NetherlandsBuildingAddedToMap (playerId, cityID, buildingID, plotID, bOriginalConstruction)
	local player = Players[playerId];
	local playerConfig = PlayerConfigurations[playerId];
	local civilization = playerConfig:GetCivilizationTypeName();
	if HasCivilizationTrait(civilization, 'TRAIT_CIVILIZATION_GROTE_RIVIEREN') then
		local building = GameInfo.Buildings[buildingID];
		if building.PrereqDistrict == 'DISTRICT_HARBOR' then
			if not player:GetCulture():HasBoostBeenTriggered(EXPLORATION_INDEX) then
				player:GetCulture():TriggerBoost(EXPLORATION_INDEX, 1);
			elseif not player:GetCulture():HasCivic(EXPLORATION_INDEX) then
				local cost = player:GetCulture():GetCultureCost(EXPLORATION_INDEX);
				player:GetCulture():SetCulturalProgress(EXPLORATION_INDEX, cost);
			end
		end
	end
end
GameEvents.BuildingConstructed.Add(NetherlandsBuildingAddedToMap);

--Aztec (version 2)
-- local GAMES_RECREATION_INDEX = GameInfo.Civics['CIVIC_GAMES_RECREATION'].Index;
-- local bAztecCivicGranted = false;

-- function AztecStartingCivic()
--     if bAztecCivicGranted then return end
    
--     if Game.GetCurrentGameTurn() ~= GameConfiguration.GetStartTurn() then return end
    
--     for _, player in ipairs(Players) do
--         if player and player:IsAlive() and player:IsMajor() then
--             local playerConfig = PlayerConfigurations[player:GetID()];
--             local civilization = playerConfig:GetCivilizationTypeName();
--             if HasCivilizationTrait(civilization, 'TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS') then
--                 if not player:GetCulture():HasCivic(GAMES_RECREATION_INDEX) then
--                     local cost = player:GetCulture():GetCultureCost(GAMES_RECREATION_INDEX);
--                     player:GetCulture():SetCulturalProgress(GAMES_RECREATION_INDEX, cost);
--                     bAztecCivicGranted = true;
--                 end
--             end
--         end
--     end
-- end

-- GameEvents.OnGameTurnStarted.Add(AztecStartingCivic);

--Cree
function OnGoodyHutReward(playerId, unitId, type, subType)
    if playerId ~= Game.GetLocalPlayer() then
        return;
    end
    local player = Players[playerId];
    local playerConfig = PlayerConfigurations[playerId];
	local civilization = playerConfig:GetCivilizationTypeName();
    if HasCivilizationTrait(civilization, 'CIVILIZATION_CREE') then
        player:GetTreasury():ChangeGoldBalance(50);
    end
end

Events.GoodyHutReward.Add(OnGoodyHutReward);