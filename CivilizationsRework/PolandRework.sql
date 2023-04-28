UPDATE Traits SET Description = 'LOC_TRAIT_CIVILIZATION_GOLDEN_LIBERTY_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY';
UPDATE Buildings SET Description = 'LOC_BUILDING_SUKIENNICE_DESCRIPTION_ZJ' WHERE BuildingType='BUILDING_SUKIENNICE';

INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
('TRAIT_CIVILIZATION_GOLDEN_LIBERTY', 'TRAIT_GOLDEN_LIBERTY_DISTRICTS_PLAINS_HOUSING'),
('TRAIT_CIVILIZATION_GOLDEN_LIBERTY', 'TRAIT_GOLDEN_LIBERTY_DISTRICTS_GRASS_PLAINS_HOUSING');

INSERT INTO Building_YieldChanges (BuildingType, YieldType, YieldChange) VALUES
('BUILDING_SUKIENNICE', 'YIELD_PRODUCTION', '2');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_SUKIENNICE', 'TRAIT_SUKIENNICE_FOOD_MIRRORS_GOLD');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_GOLDEN_LIBERTY_DISTRICTS_PLAINS_HOUSING', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 0, 0, 0, NULL, 'REQUIREMENTS_DISTRICT_ON_PLAINS'),
('TRAIT_GOLDEN_LIBERTY_DISTRICTS_GRASS_PLAINS_HOUSING', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 0, 0, 0, NULL, 'REQUIREMENTS_DISTRICT_ON_GRASS_PLAINS'),
('TRAIT_SUKIENNICE_FOOD_MIRRORS_GOLD', 'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_GOLDEN_LIBERTY_DISTRICTS_PLAINS_HOUSING', 'Amount', '1'),
('TRAIT_GOLDEN_LIBERTY_DISTRICTS_GRASS_PLAINS_HOUSING', 'Amount', '1'),
('TRAIT_SUKIENNICE_FOOD_MIRRORS_GOLD', 'YieldTypeToGrant', 'YIELD_FOOD'),
('TRAIT_SUKIENNICE_FOOD_MIRRORS_GOLD', 'YieldTypeToMirror', 'YIELD_GOLD');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('REQUIREMENTS_DISTRICT_ON_PLAINS', 'REQUIREMENTSET_TEST_ALL'),
('REQUIREMENTS_DISTRICT_ON_GRASS_PLAINS', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('REQUIREMENTS_DISTRICT_ON_PLAINS', 'PLOT_IS_PLAINS'),
('REQUIREMENTS_DISTRICT_ON_PLAINS', 'REQUIRES_DISTRICT_IS_NOT_CITY_CENTER'),
('REQUIREMENTS_DISTRICT_ON_GRASS_PLAINS', 'PLOT_IS_GRASS'),
('REQUIREMENTS_DISTRICT_ON_GRASS_PLAINS', 'REQUIRES_DISTRICT_IS_NOT_CITY_CENTER');
INSERT INTO Requirements (RequirementId, RequirementType, Inverse) VALUES 
('PLOT_IS_GRASS', 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES', 0),
('PLOT_IS_PLAINS', 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES', 0),
('REQUIRES_DISTRICT_IS_NOT_CITY_CENTER', 'REQUIREMENT_DISTRICT_TYPE_MATCHES', 1);
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('PLOT_IS_GRASS', 'TerrainType', 'TERRAIN_GRASS'),
('PLOT_IS_PLAINS', 'TerrainType', 'TERRAIN_PLAINS'),
('REQUIRES_DISTRICT_IS_NOT_CITY_CENTER', 'DistrictType', 'DISTRICT_CITY_CENTER');