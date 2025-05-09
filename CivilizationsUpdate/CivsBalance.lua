function HasCivilizationTrait(civilizationType, traitType)
	for row in GameInfo.CivilizationTraits() do
		if (row.CivilizationType == civilizationType and row.TraitType == traitType) then
			return true;
		end
	end
	return false;
end

-------------------------------------------
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

--Medici (Magnificence): "civic_foreign_trade" unlock "civic_drama_poetry"
local DRAMA_POETRY_INDEX = GameInfo.Civics['CIVIC_DRAMA_POETRY'].Index;
local FOREIGN_TRADE_INDEX = GameInfo.Civics['CIVIC_FOREIGN_TRADE'].Index;

function MediciCivicUnlock(playerId, civicIndex)
	local player = Players[playerId];
	local playerConfig = PlayerConfigurations[playerId];
	if playerConfig:GetLeaderTypeName() == "LEADER_CATHERINE_DE_MEDICI_ALT" then
		if civicIndex == FOREIGN_TRADE_INDEX then
			if not player:GetCulture():HasCivic(DRAMA_POETRY_INDEX) then
				local cost = player:GetCulture():GetCultureCost(DRAMA_POETRY_INDEX);
				player:GetCulture():SetCulturalProgress(DRAMA_POETRY_INDEX, cost);
			end
		end
	end
end

Events.CivicCompleted.Add(MediciCivicUnlock);
