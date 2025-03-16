function HasLeaderTrait(LeaderType, traitType)
	for row in GameInfo.LeaderTraits() do
		if (row.LeaderType == LeaderType and row.TraitType == traitType) then
			return true
		end
	end
	return false
end

----------------------------------
