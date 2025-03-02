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

-- Remove snow barbarian camp.
delete from Improvement_ValidTerrains where
	ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' and TerrainType = 'TERRAIN_SNOW';
delete from Improvement_ValidTerrains where
	ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' and TerrainType = 'TERRAIN_SNOW_HILLS';

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
UPDATE Improvement_BonusYieldChanges SET BonusYieldChange=2 WHERE ImprovementType='IMPROVEMENT_FISHING_BOATS' AND YieldType='YIELD_PRODUCTION';

INSERT OR REPLACE INTO Improvement_BonusYieldChanges (ImprovementType, YieldType, BonusYieldChange, PrereqTech, PrereqCivic) VALUES
('IMPROVEMENT_FISHING_BOATS', 'YIELD_GOLD', 1, 'TECH_CELESTIAL_NAVIGATION', NULL);

--Railroads need no coal
DELETE FROM Route_ResourceCosts WHERE ResourceType = 'RESOURCE_COAL' AND RouteType = 'ROUTE_RAILROAD';

--Seaside Resorts minimum appeal change
UPDATE Improvements SET MinimumAppeal = 3 WHERE ImprovementType = 'IMPROVEMENT_BEACH_RESORT';

--More Boost
INSERT OR REPLACE INTO Boosts(BoostID, TechnologyType, CivicType, Boost, TriggerDescription, TriggerLongDescription, Unit1Type, BoostClass, BuildingType, NumItems, BoostingTechType, BoostingCivicType) VALUES
(91, 'TECH_STEEL', NULL, 40, 'LOC_BOOST_TRIGGER_STEEL_ZJ', 'LOC_BOOST_TRIGGER_LONGDESC_STEEL_ZJ', NULL, 'BOOST_TRIGGER_HAVE_X_BUILDINGS', 'BUILDING_STAR_FORT', 3, NULL, NULL),
(127, NULL, 'CIVIC_IDEOLOGY', 90, 'LOC_BOOST_TRIGGER_IDEOLOGY_ZJ', 'LOC_BOOST_TRIGGER_LONGDESC_IDEOLOGY_ZJ', NULL, 'BOOST_TRIGGER_EMPIRE_POPULATION', NULL, 60, NULL, NULL);

--LV 4 GOVERNMENT cost more
UPDATE Civics SET Cost = 6200 WHERE CivicType='CIVIC_DIGITAL_DEMOCRACY';
UPDATE Civics SET Cost = 6200 WHERE CivicType='CIVIC_SYNTHETIC_TECHNOCRACY';
UPDATE Civics SET Cost = 6200 WHERE CivicType='CIVIC_CORPORATE_LIBERTARIANISM';

--Monarchy slots change to 1212 (from 2112)
insert or replace into Government_SlotCounts (GovernmentType, GovernmentSlotType, NumSlots) values
('GOVERNMENT_MONARCHY', 'SLOT_MILITARY', 1),
('GOVERNMENT_MONARCHY', 'SLOT_ECONOMIC', 2),
('GOVERNMENT_MONARCHY',	'SLOT_DIPLOMATIC', 1),
('GOVERNMENT_MONARCHY',	'SLOT_WILDCARD', 2);

--Merchant republic slots change to 1113 (from 1122)
insert or replace into Government_SlotCounts (GovernmentType, GovernmentSlotType, NumSlots) values
('GOVERNMENT_MERCHANT_REPUBLIC', 'SLOT_MILITARY', 1),
('GOVERNMENT_MERCHANT_REPUBLIC', 'SLOT_ECONOMIC', 1),
('GOVERNMENT_MERCHANT_REPUBLIC',	'SLOT_DIPLOMATIC', 1),
('GOVERNMENT_MERCHANT_REPUBLIC',	'SLOT_WILDCARD', 3);

--Communism slots change to 2411 (from 3311)
insert or replace into Government_SlotCounts (GovernmentType, GovernmentSlotType, NumSlots) values
('GOVERNMENT_COMMUNISM', 'SLOT_MILITARY', 2),
('GOVERNMENT_COMMUNISM', 'SLOT_ECONOMIC', 4),
('GOVERNMENT_COMMUNISM', 'SLOT_DIPLOMATIC', 1),
('GOVERNMENT_COMMUNISM', 'SLOT_WILDCARD', 1);

--Communism buff
UPDATE Governments SET InherentBonusDesc = 'LOC_GOVT_INHERENT_BONUS_COMMUNISM_XP1_ZJ' WHERE GovernmentType = 'GOVERNMENT_COMMUNISM';
UPDATE Modifiers SET SubjectRequirementSetId = NULL WHERE ModifierId = 'COMMUNISM_PRODUCTIVE_PEOPLE';


--city state higher defence
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_PALACE', 'PALACE_ADJUST_GARRISON_STRENGTH_MINOR_CIVS');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('PALACE_ADJUST_GARRISON_STRENGTH_MINOR_CIVS', 'MODIFIER_PLAYER_CITIES_ADJUST_INNER_DEFENSE', 0, 0, 0, NULL, 'PLAYER_IS_MINOR');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('PALACE_ADJUST_GARRISON_STRENGTH_MINOR_CIVS', 'Amount', '7');


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

--Dedications change
UPDATE CommemorationTypes SET GoldenAgeBonusDescription = 'LOC_MOMENT_CATEGORY_INFRASTRUCTURE_BONUS_GOLDEN_AGE_ZJ' WHERE CommemorationType = 'COMMEMORATION_INFRASTRUCTURE';
UPDATE CommemorationTypes SET GoldenAgeBonusDescription = 'LOC_MOMENT_CATEGORY_CULTURAL_BONUS_GOLDEN_AGE_ZJ' WHERE CommemorationType = 'COMMEMORATION_CULTURAL';

UPDATE ModifierArguments SET Value = '15' WHERE ModifierId = 'COMMEMORATION_INFRASTRUCTURE_BUILDER_DISCOUNT_MODIFIER' AND Name = 'Amount';
UPDATE ModifierArguments SET Value = '2' WHERE ModifierId = 'COMMEMORATION_CULTURAL_DISTRICTCULTURE' AND Name = 'Amount';

--Open borders gain more tourists
UPDATE GlobalParameters SET Value = '50' WHERE Name='TOURISM_OPEN_BORDERS_BONUS';

--More tourism from wonders
UPDATE GlobalParameters SET Value = '5' WHERE Name = 'TOURISM_BASE_FROM_WONDER';
UPDATE GlobalParameters SET Value = '2' WHERE Name = 'TOURISM_ADVANCED_ERA_WONDER';

--Immediately Declare Protectorate War
UPDATE DiplomaticActions SET DenouncementTurnsRequired = '0' WHERE DiplomaticActionType = 'DIPLOACTION_DECLARE_PROTECTORATE_WAR';

--Earlier Alliances
UPDATE DiplomaticActions SET InitiatorPrereqCivic='CIVIC_POLITICAL_PHILOSOPHY', TargetPrereqCivic='CIVIC_POLITICAL_PHILOSOPHY' WHERE DiplomaticActionType LIKE 'DIPLOACTION_ALLIANCE%';

--Lower alliance level's points require
UPDATE GlobalParameters SET Value = '240' WHERE Name = 'ALLIANCE_LEVEL_TWO_XP';
UPDATE GlobalParameters SET Value = '720' WHERE Name = 'ALLIANCE_LEVEL_THREE_XP';

--Great works (wrting, earier art, and music) provide more tourism
UPDATE GreatWorks SET Tourism = '3' WHERE GreatWorkObjectType = 'GREATWORKOBJECT_WRITING';
UPDATE GreatWorks SET Tourism = '4' WHERE GreatWorkObjectType = 'GREATWORKOBJECT_SCULPTURE';
UPDATE GreatWorks SET Tourism = '4' WHERE GreatWorkObjectType = 'GREATWORKOBJECT_PORTRAIT';
UPDATE GreatWorks SET Tourism = '4' WHERE GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE';
UPDATE GreatWorks SET Tourism = '4' WHERE GreatWorkObjectType = 'GREATWORKOBJECT_RELIGIOUS';
UPDATE GreatWorks SET Tourism = '8' WHERE GreatWorkObjectType = 'GREATWORKOBJECT_MUSIC';

--Great works (wrting) provide more culture
-- INSERT OR REPLACE INTO GreatWork_YieldChanges(GreatWorkType, YieldChange) VALUES 
-- SELECT a.GreatWorkType, 3 FROM GreatWorks a WHERE 
-- a.GreatWorkObjectType IN ('GREATWORKOBJECT_WRITING');
UPDATE GreatWork_YieldChanges SET YieldChange='3' WHERE YieldChange='2';

-- REPLACE INTO GreatWork_YieldChanges(GreatWorkType, YieldChange) VALUES
-- SELECT a.GreatWorkObjectType, 4 FROM GreatWorks a WHERE
-- a.GreatWorkObjectType IN ('GREATWORKOBJECT_SCULPTURE', 'GREATWORKOBJECT_PORTRAIT', 'GREATWORKOBJECT_LANDSCAPE', 'GREATWORKOBJECT_RELIGIOUS');

-- Celestial Navigation no longer requires Astrology
DELETE FROM TechnologyPrereqs WHERE Technology = 'TECH_CELESTIAL_NAVIGATION' AND PrereqTech = 'TECH_ASTROLOGY';

--SCOUT EARLY EMBARK
UPDATE Technologies SET Description = 'LOC_TECH_SAILING_DESCRIPTION_ZJ' WHERE TechnologyType = 'TECH_SAILING';

INSERT INTO TechnologyModifiers (TechnologyType, ModifierId) VALUES 
('TECH_SAILING', 'TECH_SAILING_SCOUT_EMBARK');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TECH_SAILING_SCOUT_EMBARK', 'MODIFIER_PLAYER_ADJUST_EMBARK_UNIT_PASS', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TECH_SAILING_SCOUT_EMBARK', 'UnitType', 'UNIT_SCOUT');

--MILITARY_ENGINEER buff
UPDATE Units SET BaseMoves='3', Cost='100', Description='LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION_ZJ', PrereqTech='TECH_ENGINEERING' WHERE UnitType='UNIT_MILITARY_ENGINEER';
INSERT OR REPLACE INTO Unit_BuildingPrereqs (Unit, PrereqBuilding, NumSupported) VALUES 
('UNIT_MILITARY_ENGINEER', 'BUILDING_BARRACKS', -1),
('UNIT_MILITARY_ENGINEER', 'BUILDING_STABLE', -1);

UPDATE Improvements SET PrereqTech='TECH_MILITARY_ENGINEERING' WHERE ImprovementType='IMPROVEMENT_FORT';
UPDATE Improvements SET PrereqTech='TECH_GUNPOWDER' WHERE ImprovementType='IMPROVEMENT_MOUNTAIN_TUNNEL';

--Add Description
UPDATE Technologies SET Description='LOC_TECH_BUTTRESS_DESCRIPTION_ZJ' WHERE TechnologyType='TECH_BUTTRESS';

--early lumber mill on rainforest
UPDATE Civics SET Description = 'LOC_CIVIC_GUILDS_DESCRIPTION_ZJ' WHERE CivicType = 'CIVIC_GUILDS';
UPDATE Civics SET Description = 'LOC_CIVIC_MERCANTILISM_DESCRIPTION_ZJ' WHERE CivicType = 'CIVIC_MERCANTILISM';
UPDATE Improvement_ValidFeatures SET PrereqCivic = 'CIVIC_GUILDS' WHERE ImprovementType = 'IMPROVEMENT_LUMBER_MILL' AND FeatureType='FEATURE_JUNGLE';


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