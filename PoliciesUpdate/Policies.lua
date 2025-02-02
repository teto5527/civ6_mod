function DelegationAddGold (eReactingPlayer:number, eActingPlayer:number, values:table)
    local player = Players[eActingPlayer];
    local policyID = GameInfo.Policies["POLICY_TRIBUTE"].Index
    if values.StatementType == -883488896 then
        if player:GetCulture():IsPolicyActive(policyID) then
            player:GetTreasury():ChangeGoldBalance(50);
        end
    end
end

Events.DiplomacyStatement.Add(DelegationAddGold);