function HasLeaderTrait(LeaderType, traitType)
	for row in GameInfo.LeaderTraits() do
		if (row.LeaderType == LeaderType and row.TraitType == traitType) then
			return true 
		end
	end
	return false
end






--Eleanor
function StartGmaeWithDaramPoetry (playerID:number, bFirstTimeThisTurn:boolean)
	local DRAMA_POETRY_INDEX = GameInfo.Civics['CIVIC_DRAMA_POETRY'].Index;
  	local player = Players[playerID];
	local playerConfig = PlayerConfigurations[playerID];
	local leader = playerConfig:GetLeaderTypeName();
    if HasLeaderTrait(leader, 'TRAIT_LEADER_ELEANOR_LOYALTY') then
        local cost = player:GetCulture():GetCultureCost(DRAMA_POETRY_INDEX);
        player:GetCulture():SetCulturalProgress(DRAMA_POETRY_INDEX, cost);
    end
end

Events.PlayerTurnActivated.Add(StartGmaeWithDaramPoetry);