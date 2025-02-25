function DelegationAddGold (eReactingPlayer:number, eActingPlayer:number, values:table)
    print("=== DelegationAddGold Debug ===")
    print("eReactingPlayer:", eReactingPlayer)
    print("eActingPlayer:", eActingPlayer)
    print("values table contents:")
    for k,v in pairs(values) do
        print(k, ":", v)
    end
    print("========================")

    local player = Players[eActingPlayer];
    local policyID = GameInfo.Policies["POLICY_TRIBUTE"].Index
    if values.StatementType == -883488896 then
        if player:GetCulture():IsPolicyActive(policyID) then
            player:GetTreasury():ChangeGoldBalance(50);
        end
    end
end

Events.DiplomacyStatement.Add(DelegationAddGold);