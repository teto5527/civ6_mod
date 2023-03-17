function HasLeaderTrait(LeaderType, traitType)
	for row in GameInfo.LeaderTraits() do
		if (row.LeaderType == LeaderType and row.TraitType == traitType) then
			return true 
		end
	end
	return false
end

function OnGoodyHutReward(playerId, unitId, type, subType)
    if playerId ~= Game.GetLocalPlayer() then
        return;
    end
    local player = Players[playerId];
    local playerConfig = PlayerConfigurations[playerId];
	local leader = playerConfig:GetLeaderTypeName();
    if HasLeaderTrait(leader, 'TRAIT_LEADER_CAESAR') then
        player:GetTreasury():ChangeGoldBalance(75);
    end
end

Events.GoodyHutReward.Add(OnGoodyHutReward);
