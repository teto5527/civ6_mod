-- GeneralUpdate
-- Author: zjhao
-- DateCreated: 4/30/2022 11:53:42 AM
--------------------------------------------------------------

-- free scout
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_PALACE', 'CAPITAL_GRANT_FREE_SCOUT');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('CAPITAL_GRANT_FREE_SCOUT', 'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL', 1, 1, 0, NULL, 'REQUIREMENT_HUMAN_PLAYER_FREE_SCOUT');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('CAPITAL_GRANT_FREE_SCOUT', 'AllowUniqueOverride', '1'), 
('CAPITAL_GRANT_FREE_SCOUT', 'Amount', '1'), 
('CAPITAL_GRANT_FREE_SCOUT', 'UnitType', 'UNIT_SCOUT');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQUIREMENT_HUMAN_PLAYER_FREE_SCOUT', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQUIREMENT_HUMAN_PLAYER_FREE_SCOUT', 'FREE_SCOUT_PLAYER_IS_HUMAN');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('FREE_SCOUT_PLAYER_IS_HUMAN', 'REQUIREMENT_PLAYER_IS_HUMAN');

-- Slower Barbarian tech.
update GlobalParameters set Value = 60 where Name = 'BARBARIAN_TECH_PERCENT';

-- capital free Entertainment
update Buildings set Entertainment = 2 where BuildingType = 'BUILDING_PALACE';

--farm can build on marsh
INSERT INTO Improvement_ValidFeatures(ImprovementType, FeatureType, PrereqTech) VALUES
('IMPROVEMENT_FARM', 'FEATURE_MARSH', 'TECH_IRRIGATION');
UPDATE Technologies SET Description='LOC_TECH_IRRIGATION_DESCRIPTION_ZJ' WHERE TechnologyType='TECH_IRRIGATION';

--Mine can build on lux-resources on Flood Plain
INSERT OR REPLACE INTO Improvement_ValidResources(ImprovementType, ResourceType, MustRemoveFeature) VALUES
('IMPROVEMENT_MINE', 'RESOURCE_JADE', '0'),
('IMPROVEMENT_MINE', 'RESOURCE_MERCURY', '0');

--bring forward LUMBER_MILL and QUARRY production yield tech requires
UPDATE Improvement_BonusYieldChanges SET PrereqTech='TECH_MASS_PRODUCTION' WHERE Id='227';
UPDATE Improvement_BonusYieldChanges SET PrereqTech='TECH_ENGINEERING' WHERE Id='231';

UPDATE Technologies SET Description='LOC_TECH_MASS_PRODUCTION_DESCRIPTION_ZJ' WHERE TechnologyType='TECH_MASS_PRODUCTION';
UPDATE Technologies SET Description='LOC_TECH_ENGINEERING_DESCRIPTION_ZJ' WHERE TechnologyType='TECH_ENGINEERING';

--
UPDATE Technologies SET Description = NULL WHERE TechnologyType = 'TECH_MASONRY';
UPDATE Technologies SET Description = 'LOC_TECH_MINING_DESCRIPTION_ZJ' WHERE TechnologyType = 'TECH_MINING';

UPDATE Resource_Harvests SET PrereqTech='TECH_MINING' WHERE ResourceType='RESOURCE_STONE';

--FISHING BOAT grant more yield
UPDATE Civics SET Description='LOC_CIVIC_COLONIALISM_DESCRIPTION_ZJ' WHERE CivicType='CIVIC_COLONIALISM';
UPDATE Technologies SET Description='LOC_TECH_CELESTIAL_NAVIGATION_DESCRIPTION_ZJ' WHERE TechnologyType='TECH_CELESTIAL_NAVIGATION';

INSERT OR REPLACE INTO Improvement_BonusYieldChanges (ImprovementType, YieldType, BonusYieldChange, PrereqTech, PrereqCivic) VALUES
('IMPROVEMENT_FISHING_BOATS', 'YIELD_PRODUCTION', 2, NULL, 'CIVIC_COLONIALISM'),
('IMPROVEMENT_FISHING_BOATS', 'YIELD_GOLD', 1, 'TECH_CELESTIAL_NAVIGATION', NULL);

--reduce civic_divine_right cost (from 340)
UPDATE Civics
    SET Cost =450
    WHERE CivicType='CIVIC_DIVINE_RIGHT';

--reduce civic_exploration cost
UPDATE Civics
    SET Cost =220
    WHERE CivicType='CIVIC_EXPLORATION';

--reduce civic_reformed_church cost
UPDATE Civics
    SET Cost =220
    WHERE CivicType='CIVIC_REFORMED_CHURCH';

--LV 3 GOVERNMENT cost reorganize
-- UPDATE Civics SET Cost = 640 WHERE CivicType='CIVIC_IDEOLOGY';
UPDATE Civics SET Cost = 820 WHERE CivicType='CIVIC_SUFFRAGE';
UPDATE Civics SET Cost = 820 WHERE CivicType='CIVIC_TOTALITARIANISM';
UPDATE Civics SET Cost = 820 WHERE CivicType='CIVIC_CLASS_STRUGGLE';

--Monarchy slots change to 1212 (from 2112)
insert or replace into Government_SlotCounts (GovernmentType, GovernmentSlotType, NumSlots) values
('GOVERNMENT_MONARCHY', 'SLOT_MILITARY', 1),
('GOVERNMENT_MONARCHY', 'SLOT_ECONOMIC', 2),
('GOVERNMENT_MONARCHY',	'SLOT_DIPLOMATIC', 1),
('GOVERNMENT_MONARCHY',	'SLOT_WILDCARD', 2);

--Communism slots change to 2411 (from 3311)
insert or replace into Government_SlotCounts (GovernmentType, GovernmentSlotType, NumSlots) values
('GOVERNMENT_COMMUNISM', 'SLOT_MILITARY', 2),
('GOVERNMENT_COMMUNISM', 'SLOT_ECONOMIC', 4),
('GOVERNMENT_COMMUNISM', 'SLOT_DIPLOMATIC', 1),
('GOVERNMENT_COMMUNISM', 'SLOT_WILDCARD', 1);

--Communism buff
UPDATE Policies SET Description = 'LOC_POLICY_COLLECTIVIZATION_DESCRIPTION_XP2_ZJ' WHERE PolicyType = 'POLICY_COLLECTIVIZATION';
UPDATE Governments SET InherentBonusDesc = 'LOC_GOVT_INHERENT_BONUS_COMMUNISM_XP1_ZJ' WHERE GovernmentType = 'GOVERNMENT_COMMUNISM';

UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId = 'COMMUNISM_PRODUCTIVE_PEOPLE';
UPDATE ModifierArguments SET Value=4 WHERE ModifierId='COLLECTIVIZATION_INTERNAL_TRADE_PRODUCTION' AND Name='Amount';


--city state higher defence
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_PALACE', 'PALACE_ADJUST_GARRISON_STRENGTH_MINOR_CIVS');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('PALACE_ADJUST_GARRISON_STRENGTH_MINOR_CIVS', 'MODIFIER_PLAYER_CITIES_ADJUST_INNER_DEFENSE', 0, 0, 0, NULL, 'PLAYER_IS_MINOR');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('PALACE_ADJUST_GARRISON_STRENGTH_MINOR_CIVS', 'Amount', '7');

--quicker DECLARE_PROTECTORATE_WAR 
UPDATE DiplomaticActions SET DenouncementTurnsRequired = '0' WHERE DiplomaticActionType = 'DIPLOACTION_DECLARE_PROTECTORATE_WAR';
--Trade routes provide more gold
UPDATE GlobalParameters
    SET Value='3'
    WHERE Name='TRADE_ROUTE_GOLD_PER_DESTINATION_DISTRICT';
UPDATE GlobalParameters
    SET Value='3'
    WHERE Name='TRADE_ROUTE_GOLD_PER_ORIGIN_DISTRICT';
UPDATE GlobalParameters
    SET Value='2'
    WHERE Name='TRADING_POST_GOLD_IN_FOREIGN_CITY';

--city center minimum yield 2/2
UPDATE GlobalParameters
    SET Value='2'
    WHERE Name='YIELD_PRODUCTION_CITY_TERRAIN_REPLACE';

--Open borders gain more tourists
UPDATE GlobalParameters
    SET Value='50'
    WHERE Name='TOURISM_OPEN_BORDERS_BONUS';

--SCOUT EARLY EMBARK
UPDATE Technologies SET Description = 'LOC_TECH_SAILING_DESCRIPTION_ZJ' WHERE TechnologyType = 'TECH_SAILING';

INSERT INTO TechnologyModifiers (TechnologyType, ModifierId) VALUES 
('TECH_SAILING', 'TECH_SAILING_SCOUT_EMBARK');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TECH_SAILING_SCOUT_EMBARK', 'MODIFIER_PLAYER_ADJUST_EMBARK_UNIT_PASS', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TECH_SAILING_SCOUT_EMBARK', 'UnitType', 'UNIT_SCOUT');

--MILITARY_ENGINEER buff
UPDATE Units SET BaseMoves='3', Cost='90', Description='LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION_ZJ', PrereqTech='TECH_ENGINEERING' WHERE UnitType='UNIT_MILITARY_ENGINEER';
DELETE FROM Unit_BuildingPrereqs WHERE Unit='UNIT_MILITARY_ENGINEER';

UPDATE Improvements SET PrereqTech='TECH_MILITARY_ENGINEERING' WHERE ImprovementType='IMPROVEMENT_FORT';
UPDATE Improvements SET PrereqTech='TECH_GUNPOWDER' WHERE ImprovementType='IMPROVEMENT_MOUNTAIN_TUNNEL';

--Chemistry copy industrial zone to food
UPDATE Technologies SET Description='LOC_TECH_CHEMISTRY_DESCRIPTION_ZJ' WHERE TechnologyType='TECH_CHEMISTRY';

INSERT INTO TechnologyModifiers (TechnologyType, ModifierId) VALUES 
('TECH_CHEMISTRY', 'CHEMISTRY_INDUSTRIAL_ZONE_FOOD');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('CHEMISTRY_INDUSTRIAL_ZONE_FOOD', 'MODIFIER_ALL_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS', 0, 0, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('CHEMISTRY_INDUSTRIAL_ZONE_FOOD', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE'), 
('CHEMISTRY_INDUSTRIAL_ZONE_FOOD', 'YieldTypeToGrant', 'YIELD_FOOD'), 
('CHEMISTRY_INDUSTRIAL_ZONE_FOOD', 'YieldTypeToMirror', 'YIELD_PRODUCTION');

--CRATER_LAKE
-- INSERT INTO DistrictModifiers (DistrictType, ModifierId) VALUES
-- ('DISTRICT_PRESERVE', 'CRATER_LAKE_PRESERVE_ALL_YIELD');
-- INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- ('CRATER_LAKE_PRESERVE_ALL_YIELD', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 0, 0, 0, 'CRATER_LAKE_REQUIREMENT', 'CRATER_LAKE_PRESERVE_REQUIREMENT');
-- INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
-- ('CRATER_LAKE_PRESERVE_ALL_YIELD', 'YieldType', 'YIELD_FOOD,YIELD_FAITH,YIELD_CLUTURE,YIELD_SCIENCE,YIELD_GOOD,YIELD_PRODUCTION'),
-- ('CRATER_LAKE_PRESERVE_ALL_YIELD', 'Amount', '3');

-- INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
-- ('CRATER_LAKE_REQUIREMENT', 'REQUIREMENTSET_TEST_ALL'),
-- ('CRATER_LAKE_PRESERVE_REQUIREMENT', 'REQUIREMENTSET_TEST_ALL');
-- INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
-- ('CRATER_LAKE_REQUIREMENT', 'MAP_CONTAINS_CRATER_LAKE'),
-- ('CRATER_LAKE_PRESERVE_REQUIREMENT', 'REQUIRES_PRESERVE_IS_ADJACENT_CRATER_LAKE'),
-- ('CRATER_LAKE_PRESERVE_REQUIREMENT', 'REQUIRES_DISTRICT_IS_PRESERVE');
-- INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
-- ('MAP_CONTAINS_CRATER_LAKE', 'REQUIREMENT_MAP_HAS_FEATURE'),
-- ('REQUIRES_PRESERVE_IS_ADJACENT_CRATER_LAKE', 'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES'),
-- ('REQUIRES_DISTRICT_IS_PRESERVE', 'REQUIREMENT_DISTRICT_TYPE_MATCHES');
-- INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
-- ('MAP_CONTAINS_CRATER_LAKE', 'FeatureType', 'FEATURE_CRATER_LAKE'),
-- ('REQUIRES_PRESERVE_IS_ADJACENT_CRATER_LAKE', 'FeatureType', 'FEATURE_CRATER_LAKE'),
-- ('REQUIRES_DISTRICT_IS_PRESERVE', 'DistrictType', 'DISTRICT_PRESERVE');