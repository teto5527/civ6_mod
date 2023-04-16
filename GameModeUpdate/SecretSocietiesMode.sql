
-- discover rate set to 100%
UPDATE SecretSocieties
    SET DiscoverAtBarbarianCampBaseChance='300'
    WHERE SecretSocietyType='SECRETSOCIETY_SANGUINE_PACT';
UPDATE SecretSocieties
    SET DiscoverAtCityStateBaseChance='300'
    WHERE SecretSocietyType='SECRETSOCIETY_OWLS_OF_MINERVA';
UPDATE SecretSocieties
    SET DiscoverAtGoodyHutBaseChance='300'
    WHERE SecretSocietyType='SECRETSOCIETY_VOIDSINGERS';
UPDATE SecretSocieties
    SET DiscoverAtNaturalWonderBaseChance='300'
    WHERE SecretSocietyType='SECRETSOCIETY_HERMETIC_ORDER';
--Voidsingers
--lv1:
--Support my other mod

--Sanguine Pact
--LV1:
--vampire +3 base moves when they are in friendly territory; vampire heal 25 after killed a unit
UPDATE GovernorPromotions
    SET Description='LOC_GOVERNOR_PROMOTION_SANGUINE_PACT_1_DESCRIPTION_ZJ'
    WHERE GovernorPromotionType='GOVERNOR_PROMOTION_SANGUINE_PACT_1';

INSERT OR REPLACE INTO GameModifiers (ModifierId) VALUES
('SECRET_SOCIETIES_VAMPIRE_DOMESTICATION_MOVES');

INSERT OR REPLACE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES 
('GOVERNOR_PROMOTION_SANGUINE_PACT_1', 'SECRET_SOCIETIES_VAMPIRE_DOMESTICATION_MOVES'),
('GOVERNOR_PROMOTION_SANGUINE_PACT_1', 'SECRET_SOCIETIES_VAMPIRE_HEAL_AFTER_KILL');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('SECRET_SOCIETIES_VAMPIRE_DOMESTICATION_MOVES', 'MODIFIER_PLAYER_UNITS_ADJUST_FRIENDLY_TERRITORY_START_MOVEMENT', 0, 0, 0, NULL, 'THIS_UNIT_IS_A_VAMPIRE'),
('SECRET_SOCIETIES_VAMPIRE_HEAL_AFTER_KILL', 'MODIFIER_PLAYER_UNITS_ADJUST_HEAL_FROM_COMBAT', 0, 0, 0, NULL, 'THIS_UNIT_IS_A_VAMPIRE');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('SECRET_SOCIETIES_VAMPIRE_DOMESTICATION_MOVES', 'Amount', '3'),
('SECRET_SOCIETIES_VAMPIRE_HEAL_AFTER_KILL', 'Amount', '25');

--Hermetic Order 
--lv1: ley line no longer on snow 
DELETE FROM Feature_ValidTerrains WHERE FeatureType = 'RESUORCES_LEY_LINE' AND TerrainType = 'TERRAIN_SNOW';
DELETE FROM Feature_ValidTerrains WHERE FeatureType = 'RESUORCES_LEY_LINE' AND TerrainType = 'TERRAIN_SNOW_HILLS';

--LV2
-- INSERT OR REPLACE INTO Building_YieldChanges (BuildingType, YieldType, YieldChange) VALUES('BUILDING_ALCHEMICAL_SOCIETY', 'YIELD_SCIENCE', 6);
INSERT OR REPLACE INTO Building_YieldChanges (BuildingType, YieldType, YieldChange) VALUES('BUILDING_ALCHEMICAL_SOCIETY', 'YIELD_PRODUCTION', 4);

--Support my other mod
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES ('DISTRICT_SEOWON', 'LeyLine_Science');

--Owls of Minerva
--LV1:+5% GOLD per city-state you are the Suzerain of.
UPDATE GovernorPromotions
    SET Description='LOC_GOVERNOR_PROMOTION_OWLS_OF_MINERVA_1_DESCRIPTION_ZJ'
    WHERE GovernorPromotionType='GOVERNOR_PROMOTION_OWLS_OF_MINERVA_1';

INSERT OR REPLACE INTO GameModifiers (ModifierId) VALUES
('GOVERNOR_PROMOTION_OWLS_OF_MINERVA_1_PER_TRIBUTARY_GOLD');
INSERT OR REPLACE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES 
('GOVERNOR_PROMOTION_OWLS_OF_MINERVA_1', 'GOVERNOR_PROMOTION_OWLS_OF_MINERVA_1_PER_TRIBUTARY_GOLD');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('GOVERNOR_PROMOTION_OWLS_OF_MINERVA_1_PER_TRIBUTARY_GOLD', 'MODIFIER_PLAYER_ADJUST_YIELD_MODIFIER_PER_TRIBUTARY', 0, 0, 0, NULL, NULL);
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('GOVERNOR_PROMOTION_OWLS_OF_MINERVA_1_PER_TRIBUTARY_GOLD', 'YieldType', 'YIELD_GOLD'),
('GOVERNOR_PROMOTION_OWLS_OF_MINERVA_1_PER_TRIBUTARY_GOLD', 'Amount', '2');

--LV2
INSERT OR REPLACE INTO Building_YieldChanges (BuildingType, YieldType, YieldChange) VALUES('BUILDING_GILDED_VAULT', 'YIELD_CULTURE', 4);
INSERT OR REPLACE INTO Building_GreatWorks(BuildingType, GreatWorkSlotType, NumSlots)  VALUES ('BUILDING_GILDED_VAULT', 'GREATWORKSLOT_PALACE', 1);
INSERT OR REPLACE INTO Building_GreatPersonPoints(BuildingType, GreatPersonClassType, PointsPerTurn) VALUES('BUILDING_GILDED_VAULT', 'GREAT_PERSON_CLASS_ARTIST', 2);
INSERT OR REPLACE INTO Building_GreatPersonPoints(BuildingType, GreatPersonClassType, PointsPerTurn) VALUES('BUILDING_GILDED_VAULT', 'GREAT_PERSON_CLASS_MUSICIAN', 2);