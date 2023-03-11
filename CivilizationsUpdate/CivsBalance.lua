----CivilizationandLeaderHasTrait
ExposedMembers.DLHD = ExposedMembers.DLHD or {};
ExposedMembers.DLHD.Utils = ExposedMembers.DLHD.Utils or {};
Utils = ExposedMembers.DLHD.Utils;
function CivilizationHasTrait(sCiv, sTrait)
	for tRow in GameInfo.CivilizationTraits() do
		if (tRow.CivilizationType == sCiv and tRow.TraitType == sTrait) then
			return true;
		end
	end
	return false;
end
Utils.CivilizationHasTrait = CivilizationHasTrait;

function LeaderHasTrait(sLeader, sTrait)
	for tRow in GameInfo.LeaderTraits() do
		if (tRow.LeaderType == sLeader and tRow.TraitType == sTrait) then return
			true;
		end
	end
	return false;
end
Utils.LeaderHasTrait = LeaderHasTrait;


--Eleanor
local DRAMA_POETRY_INDEX = GameInfo.Civics['CIVIC_DRAMA_POETRY'].Index;
function StartGmaeWithDaramPoetry (playerID:number, bFirstTimeThisTurn:boolean)
  	local player = Players[playerID];
	local playerConfig = PlayerConfigurations[playerID];
	local leader = playerConfig:GetLeaderTypeName();
    if LeaderHasTrait(leader, 'TRAIT_LEADER_ELEANOR_LOYALTY') then
        local cost = player:GetCulture():GetCultureCost(DRAMA_POETRY_INDEX);
        player:GetCulture():SetCulturalProgress(DRAMA_POETRY_INDEX, cost);
    end
end

Events.PlayerTurnActivated.Add(StartGmaeWithDaramPoetry);





/*

--Phoenicia Trigger Foreign Trade Boost
function DidoOnPlayerTurnActivated(playerID:number, bFirstTimeThisTurn:boolean)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sCiv = playerConfig:GetCivilizationTypeName()
	local sMediterraneanColonies = 'TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES'
	local m_ForeignTrade = GameInfo.Civics['CIVIC_FOREIGN_TRADE'].Index
	if (not CivilizationHasTrait(sCiv, sMediterraneanColonies)) then return; end
	-- print(player, playerConfig, sCiv)
	player:GetCulture():TriggerBoost(m_ForeignTrade, 0.4)
end

Events.PlayerTurnActivated.Add(DidoOnPlayerTurnActivated)

*/