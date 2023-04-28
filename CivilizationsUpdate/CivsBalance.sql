-- CivsBalance
-- Author: zjhao
-- DateCreated: 4/30/2022 12:33:31 PM
--------------------------------------------------------------

--Canada
UPDATE Traits SET Description = 'LOC_TRAIT_CIVILIZATION_FACES_OF_PEACE_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_CIVILIZATION_FACES_OF_PEACE';

UPDATE Units SET PrereqCivic='CIVIC_NATURAL_HISTORY' WHERE UnitType='UNIT_CANADA_MOUNTIE';

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_CIVILIZATION_FACES_OF_PEACE', 'TRAIT_CULTURE_AT_PEACE_BONUS'),
('TRAIT_CIVILIZATION_FACES_OF_PEACE', 'TRAIT_NATIONAL_PARK_TOURISM');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_CULTURE_AT_PEACE_BONUS', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 0, NULL, 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('TRAIT_NATIONAL_PARK_TOURISM', 'MODIFIER_PLAYER_ADJUST_TOURISM_FROM_NATIONAL_PARKS', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_CULTURE_AT_PEACE_BONUS', 'Amount', '15'),
('TRAIT_CULTURE_AT_PEACE_BONUS', 'YieldType', 'YIELD_CULTURE'),
('TRAIT_NATIONAL_PARK_TOURISM', 'Amount', '100');

--Vietnam
UPDATE ModifierArguments
    SET Value=2
    WHERE ModifierId='TRAIT_FOREST_BUILDINGS_CULTURE' AND Name='Amount';
UPDATE ModifierArguments
    SET Value=2
    WHERE ModifierId='TRAIT_JUNGLE_BUILDINGS_SCIENCE' AND Name='Amount';
UPDATE ModifierArguments
    SET Value=2
    WHERE ModifierId='TRAIT_MARSH_BUILDINGS_PRODUCTION' AND Name='Amount';

--Sumeria
UPDATE Improvements SET Description = 'LOC_IMPROVEMENT_ZIGGURAT_DESCRIPTION_ZJ' WHERE ImprovementType = 'IMPROVEMENT_ZIGGURAT';
UPDATE Units SET Description = 'LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION_ZJ' WHERE UnitType = 'UNIT_SUMERIAN_WAR_CART';
--ZIGGURAT buff
UPDATE Improvement_YieldChanges SET YieldChange=1 WHERE ImprovementType='IMPROVEMENT_ZIGGURAT' AND YieldType='YIELD_CULTURE';
INSERT OR REPLACE INTO Improvement_BonusYieldChanges (ImprovementType, YieldType, BonusYieldChange, PrereqTech) VALUES
('IMPROVEMENT_ZIGGURAT', 'YIELD_CULTURE', 1, 'TECH_EDUCATION'),
('IMPROVEMENT_ZIGGURAT', 'YIELD_SCIENCE', 1, 'TECH_EDUCATION');

--WAR_CART +7 combat when fighting against bararians
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_CIVILIZATION_UNIT_SUMERIAN_WAR_CART', 'TRAIT_WAR_CART_INCREASE_COMBAT_BARBARIAN');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_WAR_CART_INCREASE_COMBAT_BARBARIAN', 'MODIFIER_PLAYER_UNITS_ADJUST_BARBARIAN_COMBAT', 0, 0, 0, NULL, 'REQUIREMENT_UNIT_IS_WAR_CART');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_WAR_CART_INCREASE_COMBAT_BARBARIAN', 'Amount', '7');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQUIREMENT_UNIT_IS_WAR_CART', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQUIREMENT_UNIT_IS_WAR_CART', 'UNIT_IS_WAR_CART');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('UNIT_IS_WAR_CART', 'REQUIREMENT_UNIT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('UNIT_IS_WAR_CART', 'UnitType', 'UNIT_SUMERIAN_WAR_CART');

--Sweden
UPDATE Traits SET Description='LOC_TRAIT_CIVILIZATION_NOBEL_PRIZE_DESCRIPTION_ZJ' WHERE TraitType='TRAIT_CIVILIZATION_NOBEL_PRIZE';

UPDATE Buildings SET Cost=145 WHERE BuildingType='BUILDING_QUEENS_BIBLIOTHEQUE';

UPDATE ModifierArguments SET Value=2 WHERE ModifierId = 'TRAIT_GREAT_SCIENTIST_UNIVERSITY_MODIFIER' AND Name='Amount';
UPDATE ModifierArguments SET Value=2 WHERE ModifierId = 'TRAIT_GREAT_ENGINEER_FACTORY_MODIFIER' AND Name='Amount';
INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
('TRAIT_CIVILIZATION_NOBEL_PRIZE', 'TRAIT_GREAT_ARTIST_MUSEUM_ART_MODIFIER');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_GREAT_ARTIST_MUSEUM_ART_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT', 0, 0, 0, NULL, 'BUILDING_IS_MUSEUM_ART');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_GREAT_ARTIST_MUSEUM_ART_MODIFIER', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_ARTIST'),
('TRAIT_GREAT_ARTIST_MUSEUM_ART_MODIFIER', 'Amount', '2');


--Mali
insert or replace into Types (Type,	Kind) values
('MODIFIER_SINGLE_CITY_ADJUST_PLOT_PURCHASE_COST', 'KIND_MODIFIER');
insert or ignore into DynamicModifiers (ModifierType, CollectionType, EffectType) values
('MODIFIER_SINGLE_CITY_ADJUST_PLOT_PURCHASE_COST', 'COLLECTION_OWNER', 'EFFECT_ADJUST_PLOT_PURCHASE_COST');

UPDATE Traits SET Description = 'LOC_TRAIT_CIVILIZATION_MALI_GOLD_DESERT_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_CIVILIZATION_MALI_GOLD_DESERT';
UPDATE Districts SET Description = 'LOC_DISTRICT_SUGUBA_DESCRIPTION_ZJ' WHERE DistrictType = 'DISTRICT_SUGUBA';

UPDATE Modifiers SET RunOnce=1 WHERE ModifierId='GOLDEN_AGE_TRADE_ROUTE';
INSERT OR REPLACE INTO TraitModifiers(TraitType, ModifierId) VALUES 
('TRAIT_CIVILIZATION_MALI_GOLD_DESERT', 'TRAIT_PURCHASE_GOVERNMENT_PLAZA_BUILDINGS_FAITH');
INSERT OR REPLACE INTO DistrictModifiers(DistrictType, ModifierId) VALUES 
('DISTRICT_SUGUBA', 'SUGUBA_CHEAPER_PLOT_PURCHASE');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_PURCHASE_GOVERNMENT_PLAZA_BUILDINGS_FAITH', 'MODIFIER_PLAYER_CITIES_ENABLE_BUILDING_FAITH_PURCHASE', 0, 0, 0, NULL, NULL),
('SUGUBA_CHEAPER_PLOT_PURCHASE', 'MODIFIER_SINGLE_CITY_ADJUST_PLOT_PURCHASE_COST', 0, 0, 0, NULL, NULL);
INSERT OR REPLACE INTO ModifierArguments(ModifierId, Name, Value) VALUES 
('TRAIT_PURCHASE_GOVERNMENT_PLAZA_BUILDINGS_FAITH', 'DistrictType', 'DISTRICT_GOVERNMENT'),
('SUGUBA_CHEAPER_PLOT_PURCHASE', 'Amount', '-20');


-- Brazil
-- districts do not remove rainforest(hd)
insert or replace into TraitModifiers (TraitType, ModifierId) 
	select 'TRAIT_CIVILIZATION_AMAZON', 'TRAIT_DISRICTS_VALID_JUNGLE' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into Modifiers    (ModifierId, ModifierType)
    select 'TRAIT_DISRICTS_VALID_JUNGLE' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_DISRICTS_VALID_JUNGLE' || DistrictType, 'DistrictType', DistrictType
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_DISRICTS_VALID_JUNGLE' || DistrictType, 'FeatureType', 'FEATURE_JUNGLE'
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

--Aztec
UPDATE Buildings SET Description = 'LOC_BUILDING_TLACHTLI_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_TLACHTLI';

INSERT INTO Building_YieldsPerEra (BuildingType, YieldType, YieldChange) VALUES
('BUILDING_TLACHTLI', 'YIELD_CULTURE', 2),
('BUILDING_TLACHTLI', 'YIELD_FAITH', 2);


--Nubian
--Nubian_Pyramid from districts adjacent pyramid, to pyramid adjacent districts
-- UPDATE Improvements SET Description = 'LOC_IMPROVEMENT_PYRAMID_DESCRIPTION_ZJ' WHERE ImprovementType='IMPROVEMENT_PYRAMID';

-- UPDATE Adjacency_YieldChanges 
--     SET YieldChange=0
--     WHERE ID = 'Pyramid_CampusAdjacency';
-- UPDATE Adjacency_YieldChanges 
--     SET YieldChange=0
--     WHERE ID = 'Pyramid_CommercialHubAdjacency';    
-- UPDATE Adjacency_YieldChanges 
--     SET YieldChange=0
--     WHERE ID = 'Pyramid_HarborAdjacency';
-- UPDATE Adjacency_YieldChanges 
--     SET YieldChange=0
--     WHERE ID = 'Pyramid_HolySiteAdjacency';
-- UPDATE Adjacency_YieldChanges 
--     SET YieldChange=0
--     WHERE ID = 'Pyramid_IndustrialZoneAdjacency';
-- UPDATE Adjacency_YieldChanges 
--     SET YieldChange=0
--     WHERE ID = 'Pyramid_TheaterAdjacency';

-- INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentImprovement) VALUES
-- ('Nubian_Pyramid_Faith', 'LOC_DISTRICT_PYRAMID_FAITH_ZJ', 'YIELD_FAITH', '1', 'IMPROVEMENT_PYRAMID'),
-- ('Nubian_Pyramid_Science', 'LOC_DISTRICT_PYRAMID_SCIENCE_ZJ', 'YIELD_SCIENCE', '1', 'IMPROVEMENT_PYRAMID'),
-- ('Nubian_Pyramid_Gold', 'LOC_DISTRICT_PYRAMID_GOLD_ZJ', 'YIELD_GOLD', '1', 'IMPROVEMENT_PYRAMID'),
-- ('Nubian_Pyramid_Production', 'LOC_DISTRICT_PYRAMID_PRODUCTION_ZJ', 'YIELD_PRODUCTION', '1', 'IMPROVEMENT_PYRAMID'),
-- ('Nubian_Pyramid_Culture', 'LOC_DISTRICT_PYRAMID_CULTURE_ZJ', 'YIELD_CULTURE', '1', 'IMPROVEMENT_PYRAMID');

-- INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
-- ('DISTRICT_CAMPUS', 'Nubian_Pyramid_Science'),
-- ('DISTRICT_HOLY_SITE', 'Nubian_Pyramid_Faith'),
-- ('DISTRICT_COMMERCIAL_HUB', 'Nubian_Pyramid_Gold'),
-- ('DISTRICT_HARBOR', 'Nubian_Pyramid_Gold'),
-- ('DISTRICT_THEATER', 'Nubian_Pyramid_Culture'),
-- ('DISTRICT_INDUSTRIAL_ZONE', 'Nubian_Pyramid_Production');

-- Arabia
INSERT OR REPLACE INTO Building_YieldChanges (BuildingType, YieldType, YieldChange) VALUES('BUILDING_MADRASA', 'YIELD_CULTURE', 2);

--Rome
UPDATE Traits SET Description='LOC_TRAIT_CIVILIZATION_ALL_ROADS_TO_ROME_DESCRIPTION_ZJ' WHERE TraitType='TRAIT_CIVILIZATION_ALL_ROADS_TO_ROME';
INSERT INTO StartBiasResources (CivilizationType, ResourceType, Tier) VALUES
('CIVILIZATION_ROME', 'RESOURCE_IRON', '2');

INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_CIVILIZATION_ALL_ROADS_TO_ROME', 'TRAIT_INCREASE_COMBAT_BARBARIAN');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_INCREASE_COMBAT_BARBARIAN', 'MODIFIER_PLAYER_UNITS_ADJUST_BARBARIAN_COMBAT', 0, 0, 0, NULL, NULL);
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_INCREASE_COMBAT_BARBARIAN', 'Amount', '4');


--Phoenicia
UPDATE Traits SET Description ='LOC_TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES_DESCRIPTION_ZJ' WHERE TraitType='TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES';

DELETE FROM TraitModifiers WHERE ModifierId='TRAIT_FREE_TECH_BOOST_WRITING';

INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) values
('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES', 'PHOENICIA_COASTAL_CITY_ENVOY');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('PHOENICIA_COASTAL_CITY_ENVOY', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'REQUIREMENT_PHOENICIA_COASTAL_CITY_ENVOY'),
('PHOENICIA_COASTAL_CITY_ENVOY_MODIFIER', 'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN', 0, 0, 0, NULL, NULL);
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) values
('PHOENICIA_COASTAL_CITY_ENVOY', 'ModifierId','PHOENICIA_COASTAL_CITY_ENVOY_MODIFIER'),
('PHOENICIA_COASTAL_CITY_ENVOY_MODIFIER', 'Amount', '1');

INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange) VALUES
('DISTRICT_COTHON', 'YIELD_FOOD', '2'),
('DISTRICT_COTHON', 'YIELD_PRODUCTION', '1');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQUIREMENT_PHOENICIA_COASTAL_CITY_ENVOY', 'REQUIREMENTSET_TEST_ALL');	
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQUIREMENT_PHOENICIA_COASTAL_CITY_ENVOY', 'PLOT_IS_COASTAL_LAND'),
('REQUIREMENT_PHOENICIA_COASTAL_CITY_ENVOY', 'REQUIRES_NOT_CAPITAL_CITY');
INSERT INTO Requirements (RequirementId, RequirementType, Reverse) VALUES
('REQUIRES_NOT_CAPITAL_CITY', 'REQUIREMENT_COLLECTION_COUNT_ATLEAST', 1);
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 	
('REQUIRES_NOT_CAPITAL_CITY', 'CollectionType',	'COLLECTION_PLAYER_CAPITAL_CITY'),
('REQUIRES_NOT_CAPITAL_CITY', 'Count', '1');

--Mapuche
INSERT OR REPLACE INTO Improvement_ValidFeatures (ImprovementType, FeatureType, PrereqTech, PrereqCivic) VALUES 
('IMPROVEMENT_CHEMAMULL', 'FEATURE_FOREST', NULL, NULL),
('IMPROVEMENT_CHEMAMULL', 'FEATURE_JUNGLE', NULL, NULL),
('IMPROVEMENT_CHEMAMULL', 'FEATURE_MARSH', 'TECH_IRRIGATION', NULL),
('IMPROVEMENT_CHEMAMULL', 'FEATURE_FLOODPLAINS', 'TECH_BUTTRESS', NULL),
('IMPROVEMENT_CHEMAMULL', 'FEATURE_FLOODPLAINS_GRASSLAND', 'TECH_BUTTRESS', NULL),
('IMPROVEMENT_CHEMAMULL', 'FEATURE_FLOODPLAINS_PLAINS', 'TECH_BUTTRESS', NULL);

UPDATE Improvements SET Appeal = '1' WHERE ImprovementType = 'IMPROVEMENT_CHEMAMULL';

--England
UPDATE Traits SET Description='LOC_TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION_DESCRIPTION_ZJ' WHERE TraitType='TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION';

INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION', 'TRAIT_REVEAL_COAL'),
('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION', 'TRAIT_REVEAL_ALUMINUM');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_REVEAL_COAL', 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 0, 0, 0, NULL, 'REQUIREMENT_PLAYER_HAS_TECH_APPRENTICESHIP'),
('TRAIT_REVEAL_ALUMINUM', 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 0, 0, 0, NULL, 'REQUIREMENT_PLAYER_HAS_TECH_INDUSTRIALIZATION'),
('TRAIT_ACCUMULATE_MORE_ALUMINUM', 'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_ACCUMULATION_SPECIFIC_RESOURCE', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_REVEAL_COAL', 'ResourceType', 'RESOURCE_COAL'),
('TRAIT_REVEAL_ALUMINUM', 'ResourceType', 'RESOURCE_ALUMINUM'),
('TRAIT_ACCUMULATE_MORE_ALUMINUM', 'ResourceType', 'RESOURCE_ALUMINUM'),
('TRAIT_ACCUMULATE_MORE_ALUMINUM', 'Amount', '2');

INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQUIREMENT_PLAYER_HAS_TECH_INDUSTRIALIZATION', 'REQUIREMENTSET_TEST_ALL');
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQUIREMENT_PLAYER_HAS_TECH_INDUSTRIALIZATION', 'PLAYER_HAS_TECH_INDUSTRIALIZATION');
INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType) VALUES 
('PLAYER_HAS_TECH_INDUSTRIALIZATION', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('PLAYER_HAS_TECH_INDUSTRIALIZATION', 'TechnologyType', 'TECH_INDUSTRIALIZATION');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQUIREMENT_PLAYER_HAS_TECH_APPRENTICESHIP', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQUIREMENT_PLAYER_HAS_TECH_APPRENTICESHIP', 'PLAYER_HAS_TECH_APPRENTICESHIP');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('PLAYER_HAS_TECH_APPRENTICESHIP', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('PLAYER_HAS_TECH_APPRENTICESHIP', 'TechnologyType', 'TECH_APPRENTICESHIP');

UPDATE ModifierArguments
    SET Value=5 --city state +3
    WHERE ModifierId LIKE 'TRAIT_POWERED_BUILDINGS_MORE_%' AND Name='Amount';

UPDATE ModifierArguments
    SET Value=25
    WHERE ModifierId = 'TRAIT_ADJUST_INDUSTRIAL_ZONE_BUILDINGS_PRODUCTION' AND Name='Amount';

--Netherlands
UPDATE Traits SET Description='LOC_TRAIT_CIVILIZATION_GROTE_RIVIEREN_DESCRIPTION_ZJ' WHERE TraitType='TRAIT_CIVILIZATION_GROTE_RIVIEREN';

INSERT OR REPLACE INTO TraitModifiers(TraitType, ModifierId) VALUES 
('TRAIT_CIVILIZATION_GROTE_RIVIEREN', 'TRAIT_MASONRY_UNLOCK_DAM');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_MASONRY_UNLOCK_DAM', 'MODIFIER_PLAYER_ADJUST_DISTRICT_UNLOCK', 0, 0, 0, NULL, NULL);
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_MASONRY_UNLOCK_DAM', 'DistrictType', 'DISTRICT_DAM'),
('TRAIT_MASONRY_UNLOCK_DAM', 'TechType', 'TECH_MASONRY');


--America
UPDATE Traits SET Description = 'LOC_CIVILIZATION_FOUNDING_FATHERS_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_CIVILIZATION_FOUNDING_FATHERS';

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_CIVILIZATION_FOUNDING_FATHERS', 'TRAIT_FOUNDING_FATHERS_PLOTPURCHASECOST');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_FOUNDING_FATHERS_PLOTPURCHASECOST', 'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_FOUNDING_FATHERS_PLOTPURCHASECOST', 'Amount', '-25');

--Byzantium
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
('Hippodrome_Faith', 'LOC_DISTRICT_HIPPODROME_FAITH_ZJ', 'YIELD_FAITH', '2', 'DISTRICT_HIPPODROME');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
('DISTRICT_HOLY_SITE', 'Hippodrome_Faith');

--Scythia
UPDATE Traits SET Description = 'LOC_CIVILIZATION_EXTRA_LIGHT_CAVALRY_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY';

INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY', 'TRAIT_REVEAL_HORSES');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_REVEAL_HORSES', 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_REVEAL_HORSES', 'ResourceType', 'RESOURCE_HORSES');

--Macedon
UPDATE Units SET Cost='80', Maintenance='3' WHERE UnitType='UNIT_MACEDONIAN_HETAIROI';

INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES 
('TRAIT_CIVILIZATION_HELLENISTIC_FUSION', 'TRAIT_FREE_BASILIKOI_PAIDES_CLASSICAL');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
('TRAIT_FREE_BASILIKOI_PAIDES_CLASSICAL', 'MODIFIER_PLAYER_CITIES_GRANT_BUILDING_IN_CITY_IGNORE', 0, 0, 0, 'REQUIREMENT_ERA_IS_CLASSICAL', 'CITY_HAS_ENCAMPMENT');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_FREE_BASILIKOI_PAIDES_CLASSICAL', 'BuildingType', 'BUILDING_BASILIKOI_PAIDES');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQUIREMENT_ERA_IS_CLASSICAL', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQUIREMENT_ERA_IS_CLASSICAL', 'ERA_IS_CLASSICAL');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('ERA_IS_CLASSICAL', 'REQUIREMENT_GAME_ERA_IS');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('ERA_IS_CLASSICAL', 'EraType', 'ERA_CLASSICAL');



--Hungary
UPDATE Traits SET Description = 'LOC_CIVILIZATION_PEARL_DANUBE_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_CIVILIZATION_PEARL_DANUBE';

INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES 
('TRAIT_CIVILIZATION_PEARL_DANUBE', 'TRAIT_CITY_CENTER_YIELD_FOOD_GEOTHERMAL_FISSURE'),
('TRAIT_CIVILIZATION_PEARL_DANUBE', 'TRAIT_CITY_CENTER_YIELD_PRODUCTION_GEOTHERMAL_FISSURE'),
('TRAIT_CIVILIZATION_PEARL_DANUBE', 'TRAIT_CITY_CENTER_YIELD_HOUSING_GEOTHERMAL_FISSURE');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
('TRAIT_CITY_CENTER_YIELD_FOOD_GEOTHERMAL_FISSURE', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, 0, NULL, 'REQUIREMENT_CITY_CENTER_ON_GEOTHERMAL_FISSURE'),
('TRAIT_CITY_CENTER_YIELD_PRODUCTION_GEOTHERMAL_FISSURE', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, 0, NULL, 'REQUIREMENT_CITY_CENTER_ON_GEOTHERMAL_FISSURE'),
('TRAIT_CITY_CENTER_YIELD_HOUSING_GEOTHERMAL_FISSURE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 0, 0, 0, NULL, 'REQUIREMENT_CITY_CENTER_ON_GEOTHERMAL_FISSURE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_CITY_CENTER_YIELD_FOOD_GEOTHERMAL_FISSURE', 'Amount', '2'),
('TRAIT_CITY_CENTER_YIELD_FOOD_GEOTHERMAL_FISSURE', 'YieldType', 'YIELD_FOOD'),
('TRAIT_CITY_CENTER_YIELD_PRODUCTION_GEOTHERMAL_FISSURE', 'Amount', '2'),
('TRAIT_CITY_CENTER_YIELD_PRODUCTION_GEOTHERMAL_FISSURE', 'YieldType', 'YIELD_PRODUCTION'),
('TRAIT_CITY_CENTER_YIELD_HOUSING_GEOTHERMAL_FISSURE', 'Amount', '1');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQUIREMENT_CITY_CENTER_ON_GEOTHERMAL_FISSURE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQUIREMENT_CITY_CENTER_ON_GEOTHERMAL_FISSURE', 'PLOT_HAS_FEATURE_GEOTHERMAL_FISSURE');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('PLOT_HAS_FEATURE_GEOTHERMAL_FISSURE', 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('PLOT_HAS_FEATURE_GEOTHERMAL_FISSURE', 'FeatureType', 'FEATURE_GEOTHERMAL_FISSURE');

