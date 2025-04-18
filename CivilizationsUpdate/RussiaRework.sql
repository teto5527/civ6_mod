UPDATE Districts SET Description = 'LOC_DISTRICT_LAVRA_DESCRIPTION_ZJ' WHERE DistrictType = 'DISTRICT_LAVRA';

UPDATE District_GreatPersonPoints SET PointsPerTurn = '1' WHERE DistrictType = 'DISTRICT_LAVRA';

UPDATE ModifierArguments 
SET Value = 'GREAT_PERSON_CLASS_PROPHET'
WHERE ModifierId = 'TRAIT_SHRINE_WRITING_POINTS' 
AND Name = 'GreatPersonClassType';

UPDATE ModifierArguments 
SET Value = 'GREAT_PERSON_CLASS_WRITER'
WHERE ModifierId = 'TRAIT_TEMPLE_ARTIST_POINTS' 
AND Name = 'GreatPersonClassType';

UPDATE ModifierArguments 
SET Value = 'GREAT_PERSON_CLASS_ARTIST'
WHERE ModifierId = 'TRAIT_TIER3_MUSICIAN_POINTS' 
AND Name = 'GreatPersonClassType';