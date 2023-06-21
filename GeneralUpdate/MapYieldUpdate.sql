--DESERT terrain +1 faith
insert or replace into Terrain_YieldChanges values
	-- TerrainType, YieldType, YieldChange
	('TERRAIN_DESERT', 'YIELD_FAITH', 1),
	('TERRAIN_DESERT_HILLS', 'YIELD_FAITH', 1);
insert or replace into Feature_YieldChanges (FeatureType, YieldType, YieldChange) values
    ('FEATURE_FLOODPLAINS', 'YIELD_FAITH', -1),
    ('FEATURE_OASIS', 'YIELD_GOLD', 0),
    ('FEATURE_OASIS', 'YIELD_FAITH', 1),
	('FEATURE_WHITEDESERT', 'YIELD_FAITH', 1),
	('FEATURE_EYE_OF_THE_SAHARA', 'YIELD_FAITH', 1);

update ModifierArguments 
    set Value = 1 
    where ModifierId = 'EYESAHARA_SCIENCE_ATOMIC' and Name = 'Amount';

--capital +1 food to floodPlain
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_PALACE', 'PALACE_FOOD_floodPlain');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('PALACE_FOOD_floodPlain', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 0, 0, 0, NULL, 'FEATURE_IS_FLOODPLAINS');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('PALACE_FOOD_floodPlain', 'Amount', '1'), 
('PALACE_FOOD_floodPlain', 'YieldType', 'YIELD_FOOD');
-- RequirementSets
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('FEATURE_IS_FLOODPLAINS', 'REQUIREMENTSET_TEST_ANY');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('FEATURE_IS_FLOODPLAINS', 'REQUIRES_FLOODPLAINS_IN_PLOT'), 
('FEATURE_IS_FLOODPLAINS', 'REQUIRES_FLOODPLAINS_GRASSLAND_IN_PLOT'), 
('FEATURE_IS_FLOODPLAINS', 'REQUIRES_FLOODPLAINS_PLAINS_IN_PLOT');
-- Requirements
INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('REQUIRES_FLOODPLAINS_IN_PLOT', 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES'), 
('REQUIRES_FLOODPLAINS_GRASSLAND_IN_PLOT', 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES'), 
('REQUIRES_FLOODPLAINS_PLAINS_IN_PLOT', 'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('REQUIRES_FLOODPLAINS_IN_PLOT', 'FeatureType', 'FEATURE_FLOODPLAINS'), 
('REQUIRES_FLOODPLAINS_GRASSLAND_IN_PLOT', 'FeatureType', 'FEATURE_FLOODPLAINS_GRASSLAND'), 
('REQUIRES_FLOODPLAINS_PLAINS_IN_PLOT', 'FeatureType', 'FEATURE_FLOODPLAINS_PLAINS');

--Copper, Crabs, and Corn gain 3 gold
-- INSERT OR REPLACE INTO Resource_YieldChanges(ResourceType, YieldType, YieldChange) VALUES 
-- ('RESOURCE_COPPER', 'YIELD_GOLD', '3'),
-- ('RESOURCE_MAIZE', 'YIELD_GOLD', '3'),
-- ('RESOURCE_CRABS', 'YIELD_GOLD', '3');

--Marsh can be on plains
INSERT INTO Feature_ValidTerrains(FeatureType, TerrainType) VALUES
('FEATURE_MARSH', 'TERRAIN_PLAINS');

--resources more Placement
-- UPDATE Resources SET Frequency='12' WHERE ResourceType='RESOURCE_STONE';

INSERT INTO Resource_ValidFeatures(ResourceType, FeatureType) VALUES
('RESOURCE_COPPER', 'FEATURE_JUNGLE'),
('RESOURCE_COPPER', 'FEATURE_FOREST'),
('RESOURCE_JADE', 'FEATURE_FLOODPLAINS'),
('RESOURCE_JADE', 'FEATURE_FLOODPLAINS_GRASSLAND'),
('RESOURCE_JADE', 'FEATURE_FLOODPLAINS_PLAINS'),
('RESOURCE_TEA', 'FEATURE_MARSH'),
('RESOURCE_SILK', 'FEATURE_MARSH'),
('RESOURCE_SILK', 'FEATURE_JUNGLE'),
('RESOURCE_MERCURY', 'FEATURE_GEOTHERMAL_FISSURE');

UPDATE Improvement_ValidResources SET MustRemoveFeature='0' WHERE ResourceType='RESOURCE_COPPER';

DELETE FROM Resource_ValidTerrains WHERE ResourceType='RESOURCE_JADE' AND TerrainType='TERRAIN_TUNDRA';
INSERT INTO Resource_ValidTerrains(ResourceType, TerrainType) VALUES 
('RESOURCE_MERCURY', 'TERRAIN_PLAINS_HILLS'),
('RESOURCE_OLIVES', 'TERRAIN_GRASS_HILLS');