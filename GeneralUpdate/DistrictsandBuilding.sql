--Districts start with 1 CitizenSlots
UPDATE Districts
SET CitizenSlots = 1
WHERE DistrictType IN (SELECT DistrictType FROM District_CitizenYieldChanges GROUP BY DistrictType);

--Theater more ADJUSTMENT
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
('DISTRICT_THEATER', 'District_Culture_City_Center');

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
('DISTRICT_CULTURE_CITY_CENTER_MAJOR', 'LOC_DISTRICT_CULTURE_CITY_CENTER_MAJOR_ZJ', 'YIELD_CULTURE', '2', 'DISTRICT_CITY_CENTER');
UPDATE District_Adjacencies SET YieldChangeId = 'DISTRICT_CULTURE_CITY_CENTER_MAJOR' WHERE DistrictType = 'DISTRICT_ACROPOLIS' AND YieldChangeId = 'District_Culture_City_Center'
AND EXISTS (SELECT 1 FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_ACROPOLIS');
UPDATE Districts SET Description = 'LOC_DISTRICT_ACROPOLIS_EXPANSION2_DESCRIPTION' WHERE DistrictType = 'DISTRICT_ACROPOLIS';

--LightHouse yiled 1 production
INSERT OR REPLACE INTO Building_YieldChanges(BuildingType, YieldType, YieldChange) VALUES
('BUILDING_LIGHTHOUSE', 'YIELD_PRODUCTION', '1');

--Bank
--Yiled more gold
UPDATE Building_YieldChanges SET YieldChange = 7 WHERE BuildingType = 'BUILDING_BANK' AND YieldType = 'YIELD_GOLD';

UPDATE Building_YieldChanges SET YieldChange = 7 WHERE BuildingType = 'BUILDING_GRAND_BAZAAR' AND YieldType = 'YIELD_GOLD'
AND EXISTS (SELECT 1 FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GRAND_BAZAAR');

UPDATE Building_YieldChanges SET YieldChange = 7 WHERE BuildingType = 'BUILDING_GILDED_VAULT' AND YieldType = 'YIELD_GOLD'
AND EXISTS (SELECT 1 FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GILDED_VAULT');

--Extra trade route if city has harbor
-- INSERT OR REPLACE INTO BuildingModifiers (BuildingType, ModifierId) VALUES
-- ('BUILDING_BANK', 'BUILDING_GILDED_VAULT_TRADE_ROUTE_CAPACITY');

-- INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- ('BUILDING_GILDED_VAULT_TRADE_ROUTE_CAPACITY', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 0, 0, 0, NULL, 'THIS_CITY_HAS_HARBOR');
-- INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
-- ('BUILDING_GILDED_VAULT_TRADE_ROUTE_CAPACITY', 'Amount', '1');

--Industrial zone
--more citizen slots
UPDATE Buildings SET CitizenSlots='2' WHERE BuildingType='BUILDING_WORKSHOP';
UPDATE Buildings SET CitizenSlots='4' WHERE BuildingType='BUILDING_FACTORY';
UPDATE Buildings SET CitizenSlots='4' WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY';
UPDATE Buildings SET CitizenSlots='3' WHERE BuildingType='BUILDING_COAL_POWER_PLANT';
UPDATE Buildings SET CitizenSlots='3' WHERE BuildingType='BUILDING_FOSSIL_FUEL_POWER_PLANT';
UPDATE Buildings SET CitizenSlots='3' WHERE BuildingType='BUILDING_POWER_PLANT';

--more Building_CitizenYieldChanges
INSERT OR REPLACE INTO Building_CitizenYieldChanges (BuildingType, YieldType, YieldChange) VALUES
('BUILDING_WORKSHOP', 'YIELD_PRODUCTION', '1'),
('BUILDING_ELECTRONICS_FACTORY', 'YIELD_PRODUCTION', '1'),
('BUILDING_FACTORY', 'YIELD_PRODUCTION', '1');

--Industrial zone Buildings COST REDUCED
UPDATE Buildings SET Cost=160 WHERE BuildingType='BUILDING_WORKSHOP';
UPDATE Buildings SET Cost=300 WHERE BuildingType='BUILDING_FACTORY';
UPDATE Buildings SET Cost=300 WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY';

--POWER_PLANTS
INSERT OR REPLACE INTO Building_YieldChanges(BuildingType, YieldType, YieldChange) VALUES
('BUILDING_FOSSIL_FUEL_POWER_PLANT', 'YIELD_PRODUCTION', '6'),
('BUILDING_POWER_PLANT', 'YIELD_PRODUCTION', '10');
UPDATE Resource_Consumption SET PowerProvided=6 WHERE ResourceType='RESOURCE_OIL';

--Oil Power pre-tech set to Refining
UPDATE Buildings SET PrereqTech = 'TECH_REFINING' WHERE BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT';
UPDATE Projects SET PrereqTech = 'TECH_REFINING' WHERE ProjectType = 'PROJECT_CONVERT_REACTOR_TO_OIL';

--Aerodrome
--ADD MORE ADJUSTMENT form Aerodrome
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
('AERODROME_Gold', 'LOC_DISTRICT_AERODROME_GOLD_ZJ', 'YIELD_GOLD', '2', 'DISTRICT_AERODROME'),
('AERODROME_Production', 'LOC_DISTRICT_AERODROME_PRODUCTION_ZJ', 'YIELD_PRODUCTION', '2', 'DISTRICT_AERODROME');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
('DISTRICT_COMMERCIAL_HUB', 'AERODROME_Gold'),
('DISTRICT_INDUSTRIAL_ZONE', 'AERODROME_Production'),
('DISTRICT_SUGUBA', 'AERODROME_Gold'),
('DISTRICT_HANSA', 'AERODROME_Production');

--Add Trade Route Yield as Harbor
INSERT INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES
('DISTRICT_AERODROME', 'YIELD_PRODUCTION', 0, 1, 0),
('DISTRICT_AERODROME', 'YIELD_GOLD', 0, 0, 3);

--Airport +100% CITY TOURISM
UPDATE Buildings SET Description = 'LOC_BUILDING_AIRPORT_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_AIRPORT';

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_AIRPORT', 'AIRPORT_DOUBLE_NATIONAL_PARK_TOURISM'),
('BUILDING_AIRPORT', 'AIRPORT_DOUBLE_IMPROVEMENT_TOURISM'),
('BUILDING_AIRPORT', 'AIRPORT_DOUBLE_WONDER_TOURISM');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('AIRPORT_DOUBLE_NATIONAL_PARK_TOURISM', 'MODIFIER_SINGLE_CITY_ADJUST_NATIONAL_PARK_TOURISM', 0, 0, 0, NULL, NULL),
('AIRPORT_DOUBLE_IMPROVEMENT_TOURISM', 'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_TOURISM', 0, 0, 0, NULL, NULL),
('AIRPORT_DOUBLE_WONDER_TOURISM', 'MODIFIER_SINGLE_CITY_ADJUST_TOURISM', 0, 0, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('AIRPORT_DOUBLE_NATIONAL_PARK_TOURISM', 'Amount', '100'),
('AIRPORT_DOUBLE_IMPROVEMENT_TOURISM', 'Amount', '100'),
('AIRPORT_DOUBLE_WONDER_TOURISM', 'BoostsWonders', '1'),
('AIRPORT_DOUBLE_WONDER_TOURISM', 'Amount', '200');

--SHOPPING MALL TOURISM From 4
-- UPDATE ModifierArguments SET Value = 20 WHERE BuildingType = 'SHOPPING_MALL_TOURISM';

--Water Mill: farm buid on resouce gain +1 Food, pasture +1 production and no longer needs to adjacent to a River
UPDATE Buildings SET Description = 'LOC_BUILDING_WATER_MILL_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_WATER_MILL';

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES
('BUILDING_WATER_MILL' ,'WATERMILL_ADDPASTURERODUCTION');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
('WATERMILL_ADDPASTURERODUCTION', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, 0, NULL, 'PLOT_HAS_PASTURE_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('WATERMILL_ADDPASTURERODUCTION', 'Amount', '1'),
('WATERMILL_ADDPASTURERODUCTION', 'YieldType', 'YIELD_PRODUCTION');

UPDATE ModifierArguments
    SET Value='1'
    WHERE ModifierId='WATERMILL_ADDRICEFOOD' AND Name='Amount';
UPDATE ModifierArguments
    SET Value='1'
    WHERE ModifierId='WATERMILL_ADDWHEATYIELD' AND Name='Amount';
UPDATE ModifierArguments
    SET Value='1'
    WHERE ModifierId='WATERMILL_ADDMAIZEYIELD' AND Name='Amount';

UPDATE Buildings
    SET RequiresAdjacentRiver='0'
    WHERE BuildingType='BUILDING_WATER_MILL';

--Sewer yield Entertainment
UPDATE Buildings 
    SET Entertainment = 1 
    WHERE BuildingType = 'BUILDING_SEWER';

--Dam cost reduce
UPDATE Districts SET Cost = 36 WHERE DistrictType='DISTRICT_DAM';

--Canals: provide +2 gold to COMMERCIAL_HUB and HARBOR, reduce it's cost; unlock by TECH_CONSTRUCTION
UPDATE Districts SET PrereqTech='TECH_CONSTRUCTION' WHERE DistrictType='DISTRICT_CANAL';
UPDATE Districts SET Cost=36 WHERE DistrictType='DISTRICT_CANAL';

UPDATE Moments SET EraScore = 3 WHERE MomentType='MOMENT_DISTRICT_CONSTRUCTED_CANAL';

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
('Canal_Gold', 'LOC_DISTRICT_CANAL_GOLD_ZJ', 'YIELD_GOLD', '2', 'DISTRICT_CANAL');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
('DISTRICT_COMMERCIAL_HUB', 'Canal_Gold'),
('DISTRICT_SUGUBA', 'Canal_Gold'),

('DISTRICT_HARBOR', 'Canal_Gold'),
('DISTRICT_ROYAL_NAVY_DOCKYARD', 'Canal_Gold'),
('DISTRICT_COTHON', 'Canal_Gold');

--BUILDING_GOV_TALL
UPDATE Buildings SET Description='LOC_BUILDING_GOV_TALL_DESCRIPTION_ZJ' WHERE BuildingType='BUILDING_GOV_TALL';

UPDATE Modifiers SET SubjectRequirementSetId=NULL WHERE ModifierId='GOV_TALL_HOUSING_BUFF';
UPDATE ModifierArguments SET Value='1' WHERE ModifierId='GOV_TALL_HOUSING_BUFF';
UPDATE BuildingModifiers SET ModifierId='GOV_TALL_CITIES_GAIN_YIELDS' WHERE BuildingType='BUILDING_GOV_TALL' AND ModifierId='GOV_TALL_AMENITY_BUFF';
UPDATE BuildingModifiers SET ModifierId='GOV_TALL_CITIES_LOSE_YIELDS_1' WHERE BuildingType='BUILDING_GOV_TALL' AND ModifierId='GOV_TALL_LOYALTY_DEBUFF';
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES
('BUILDING_GOV_TALL', 'GOV_TALL_CITIES_LOSE_YIELDS_2'),
('BUILDING_GOV_TALL', 'GOV_TALL_CITIES_LOSE_YIELDS_3'),
('BUILDING_GOV_TALL', 'GOV_TALL_CITIES_LOSE_YIELDS_4');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('GOV_TALL_CITIES_GAIN_YIELDS', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 0, 0, 0, NULL, NULL),
('GOV_TALL_CITIES_LOSE_YIELDS_1', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 0, 0, 0, NULL, 'REQUIREMENT_PLAYER_HAS_2_CITIES'),
('GOV_TALL_CITIES_LOSE_YIELDS_2', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 0, 0, 0, NULL, 'REQUIREMENT_PLAYER_HAS_3_CITIES'),
('GOV_TALL_CITIES_LOSE_YIELDS_3', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 0, 0, 0, NULL, 'REQUIREMENT_PLAYER_HAS_4_CITIES'),
('GOV_TALL_CITIES_LOSE_YIELDS_4', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 0, 0, 0, NULL, 'REQUIREMENT_PLAYER_HAS_5_CITIES');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('GOV_TALL_CITIES_GAIN_YIELDS', 'YieldType', 'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'), 
('GOV_TALL_CITIES_GAIN_YIELDS', 'Amount', '40, 40, 40, 40, 40, 40'), 
('GOV_TALL_CITIES_LOSE_YIELDS_1', 'YieldType', 'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'), 
('GOV_TALL_CITIES_LOSE_YIELDS_1', 'Amount', '-10, -10, -10, -10, -10, -10'), 
('GOV_TALL_CITIES_LOSE_YIELDS_2', 'YieldType', 'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'), 
('GOV_TALL_CITIES_LOSE_YIELDS_2', 'Amount', '-10, -10, -10, -10, -10, -10'), 
('GOV_TALL_CITIES_LOSE_YIELDS_3', 'YieldType', 'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'), 
('GOV_TALL_CITIES_LOSE_YIELDS_3', 'Amount', '-10, -10, -10, -10, -10, -10'), 
('GOV_TALL_CITIES_LOSE_YIELDS_4', 'YieldType', 'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'), 
('GOV_TALL_CITIES_LOSE_YIELDS_4', 'Amount', '-10, -10, -10, -10, -10, -10');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQUIREMENT_PLAYER_HAS_2_CITIES', 'REQUIREMENTSET_TEST_ALL'),
('REQUIREMENT_PLAYER_HAS_3_CITIES', 'REQUIREMENTSET_TEST_ALL'),
('REQUIREMENT_PLAYER_HAS_4_CITIES', 'REQUIREMENTSET_TEST_ALL'),
('REQUIREMENT_PLAYER_HAS_5_CITIES', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQUIREMENT_PLAYER_HAS_2_CITIES', 'REQUIRES_PLAYER_HAS_2_CITIES'),
('REQUIREMENT_PLAYER_HAS_3_CITIES', 'REQUIRES_PLAYER_HAS_3_CITIES'),
('REQUIREMENT_PLAYER_HAS_4_CITIES', 'REQUIRES_PLAYER_HAS_4_CITIES'),
('REQUIREMENT_PLAYER_HAS_5_CITIES', 'REQUIRES_PLAYER_HAS_5_CITIES');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('REQUIRES_PLAYER_HAS_2_CITIES', 'REQUIREMENT_PLAYER_HAS_AT_LEAST_NUMBER_CITIES'),
('REQUIRES_PLAYER_HAS_3_CITIES', 'REQUIREMENT_PLAYER_HAS_AT_LEAST_NUMBER_CITIES'),
('REQUIRES_PLAYER_HAS_4_CITIES', 'REQUIREMENT_PLAYER_HAS_AT_LEAST_NUMBER_CITIES'),
('REQUIRES_PLAYER_HAS_5_CITIES', 'REQUIREMENT_PLAYER_HAS_AT_LEAST_NUMBER_CITIES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('REQUIRES_PLAYER_HAS_2_CITIES', 'Amount', '2'),
('REQUIRES_PLAYER_HAS_3_CITIES', 'Amount', '3'),
('REQUIRES_PLAYER_HAS_4_CITIES', 'Amount', '4'),
('REQUIRES_PLAYER_HAS_5_CITIES', 'Amount', '5');

--Diplomatic Quarter buildings grant alliance points
UPDATE Buildings SET Description = 'LOC_BUILDING_CONSULATE_DESCRIPTION_ZJ' WHERE BuildingType='BUILDING_CONSULATE';
UPDATE Buildings SET Description = 'LOC_BUILDING_CHANCERY_DESCRIPTION_ZJ' WHERE BuildingType='BUILDING_CHANCERY';

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_CONSULATE', 'CONSULATE_ALLIANCE_POINTS'),
('BUILDING_CHANCERY', 'CHANCERY_ALLIANCE_POINTS');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('CONSULATE_ALLIANCE_POINTS', 'MODIFIER_PLAYER_ADJUST_ALLIANCE_POINTS', 0, 0, 0, NULL, NULL),
('CHANCERY_ALLIANCE_POINTS', 'MODIFIER_PLAYER_ADJUST_ALLIANCE_POINTS', 0, 0, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('CONSULATE_ALLIANCE_POINTS', 'Amount', '1'),
('CHANCERY_ALLIANCE_POINTS', 'Amount', '1');



-- Preserve
UPDATE Districts 
SET CostProgressionModel = 'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH' 
WHERE DistrictType = 'DISTRICT_PRESERVE';

UPDATE Districts 
SET CostProgressionParam1 = 40 
WHERE DistrictType = 'DISTRICT_PRESERVE';

UPDATE Districts 
SET CityStrengthModifier = 2 
WHERE DistrictType = 'DISTRICT_PRESERVE';

INSERT INTO District_TradeRouteYields(DistrictType, YieldType, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES
('DISTRICT_PRESERVE', 'YIELD_FOOD', 1, 0),
('DISTRICT_PRESERVE', 'YIELD_FAITH', 0, 1);

--========================================================================
-- To grant the yields to Water tiles, we'll have to use the Modifier system.
--========================================================================
-- Requirements
--------------------------------------------------------------------------
INSERT INTO Requirements
		(RequirementId,								RequirementType)
VALUES	('P0K_REQUIRES_PLOT_ADJACENT_TO_GROVE',		'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES'),
		('P0K_REQUIRES_PLOT_ADJACENT_TO_SANCTUARY',	'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES');
--------------------------------------------------------------------------
-- RequirementArguments
--------------------------------------------------------------------------
INSERT INTO RequirementArguments
		(RequirementId,								Name,			Value)
VALUES	('P0K_REQUIRES_PLOT_ADJACENT_TO_GROVE',		'BuildingType',	'BUILDING_GROVE'),
		('P0K_REQUIRES_PLOT_ADJACENT_TO_SANCTUARY',	'BuildingType',	'BUILDING_SANCTUARY');
--------------------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------------------
INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
VALUES	('P0K_WATER_PLOT_ADJACENT_TO_GROVE',		'REQUIREMENTSET_TEST_ALL'),
		('P0K_WATER_PLOT_ADJACENT_TO_SANCTUARY',	'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
VALUES	('P0K_WATER_PLOT_ADJACENT_TO_GROVE',		'P0K_REQUIRES_PLOT_ADJACENT_TO_GROVE'),
		('P0K_WATER_PLOT_ADJACENT_TO_GROVE',		'REQUIRES_PLOT_HAS_COAST'),
		('P0K_WATER_PLOT_ADJACENT_TO_SANCTUARY',	'P0K_REQUIRES_PLOT_ADJACENT_TO_SANCTUARY'),
		('P0K_WATER_PLOT_ADJACENT_TO_SANCTUARY',	'REQUIRES_PLOT_HAS_COAST');
--------------------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------------------
INSERT INTO Modifiers
		(ModifierId,									ModifierType,						SubjectRequirementSetId)
VALUES	('P0K_WATER_BONUS_FAITH_FROM_GROVE',			'MODIFIER_GAME_ADJUST_PLOT_YIELD',	'P0K_WATER_PLOT_ADJACENT_TO_GROVE'),
		('P0K_WATER_BONUS_FOOD_FROM_GROVE',				'MODIFIER_GAME_ADJUST_PLOT_YIELD',	'P0K_WATER_PLOT_ADJACENT_TO_GROVE'),
		('P0K_WATER_BONUS_CULTURE_FROM_GROVE',			'MODIFIER_GAME_ADJUST_PLOT_YIELD',	'P0K_WATER_PLOT_ADJACENT_TO_GROVE'),
		('P0K_WATER_BONUS_GOLD_FROM_SANCTUARY',			'MODIFIER_GAME_ADJUST_PLOT_YIELD',	'P0K_WATER_PLOT_ADJACENT_TO_SANCTUARY'),
		('P0K_WATER_BONUS_SCIENCE_FROM_SANCTUARY',		'MODIFIER_GAME_ADJUST_PLOT_YIELD',	'P0K_WATER_PLOT_ADJACENT_TO_SANCTUARY'),
		('P0K_WATER_BONUS_PRODUCTION_FROM_SANCTUARY',	'MODIFIER_GAME_ADJUST_PLOT_YIELD',	'P0K_WATER_PLOT_ADJACENT_TO_SANCTUARY');
--------------------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------------------
INSERT INTO ModifierArguments
		(ModifierId,									Name,			Value)
VALUES	('P0K_WATER_BONUS_FAITH_FROM_GROVE',			'YieldType',	'YIELD_FAITH'),
		('P0K_WATER_BONUS_FAITH_FROM_GROVE',			'Amount',		1),
		('P0K_WATER_BONUS_FOOD_FROM_GROVE',				'YieldType',	'YIELD_FOOD'),
		('P0K_WATER_BONUS_FOOD_FROM_GROVE',				'Amount',		1),
		('P0K_WATER_BONUS_CULTURE_FROM_GROVE',			'YieldType',	'YIELD_CULTURE'),
		('P0K_WATER_BONUS_CULTURE_FROM_GROVE',			'Amount',		1),
		('P0K_WATER_BONUS_GOLD_FROM_SANCTUARY',			'YieldType',	'YIELD_GOLD'),
		('P0K_WATER_BONUS_GOLD_FROM_SANCTUARY',			'Amount',		1),
		('P0K_WATER_BONUS_SCIENCE_FROM_SANCTUARY',		'YieldType',	'YIELD_SCIENCE'),
		('P0K_WATER_BONUS_SCIENCE_FROM_SANCTUARY',		'Amount',		1),
		('P0K_WATER_BONUS_PRODUCTION_FROM_SANCTUARY',	'YieldType',	'YIELD_PRODUCTION'),
		('P0K_WATER_BONUS_PRODUCTION_FROM_SANCTUARY',	'Amount',		1);
--------------------------------------------------------------------------
-- GameModifiers
--------------------------------------------------------------------------
INSERT INTO GameModifiers
		(ModifierId)
VALUES	('P0K_WATER_BONUS_FAITH_FROM_GROVE'),
		('P0K_WATER_BONUS_FOOD_FROM_GROVE'),
		('P0K_WATER_BONUS_CULTURE_FROM_GROVE'),
		('P0K_WATER_BONUS_GOLD_FROM_SANCTUARY'),
		('P0K_WATER_BONUS_SCIENCE_FROM_SANCTUARY'),
		('P0K_WATER_BONUS_PRODUCTION_FROM_SANCTUARY');