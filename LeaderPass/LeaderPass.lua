--Caesar
function OnGoodyHutReward(playerId, unitId, type, subType)
    local player = Players[playerId];
    local playerConfig = PlayerConfigurations[playerId];
    if playerConfig:GetLeaderTypeName() == "LEADER_JULIUS_CAESAR" then
        player:GetTreasury():ChangeGoldBalance(50);
    end
end

Events.GoodyHutReward.Add(OnGoodyHutReward);