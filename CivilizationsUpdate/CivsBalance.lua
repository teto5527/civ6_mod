function HasCivilizationTrait(civilizationType, traitType)
	for row in GameInfo.CivilizationTraits() do
		if (row.CivilizationType == civilizationType and row.TraitType == traitType) then
			return true;
		end
	end
	return false;
end






function HasLeaderTrait(LeaderType, traitType)
	for row in GameInfo.LeaderTraits() do
		if (row.LeaderType == LeaderType and row.TraitType == traitType) then
			return true 
		end
	end
	return false
end






--Eleanor
local DRAMA_POETRY_INDEX = GameInfo.Civics['CIVIC_DRAMA_POETRY'].Index;

function FirstCivicDaramPoetry(playerId, iCivic)
  	local player = Players[playerId];
	local playerConfig = PlayerConfigurations[playerId];
	local leader = playerConfig:GetLeaderTypeName();
    if HasLeaderTrait(leader, 'TRAIT_LEADER_ELEANOR_LOYALTY') then
		if not player:GetCulture():HasCivic(DRAMA_POETRY_INDEX) then
			local cost = player:GetCulture():GetCultureCost(DRAMA_POETRY_INDEX);
			player:GetCulture():SetCulturalProgress(DRAMA_POETRY_INDEX, cost);
		end
    end
end

Events.CivicCompleted.Add(FirstCivicDaramPoetry);

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
Events.DiplomacyMeet.Add(PhoeniciaWitingOnMeet);