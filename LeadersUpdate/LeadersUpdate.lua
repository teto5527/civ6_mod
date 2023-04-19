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