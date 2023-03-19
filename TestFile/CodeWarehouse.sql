--+100% production toward DIPLOMATIC_QUARTER

-- INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
-- ('TRAIT_CIVILIZATION_WONDER_TOURISM', 'TRAIT_DIPLOMATIC_QUARTER_PRODUCTION'),
-- ('TRAIT_CIVILIZATION_WONDER_TOURISM', 'TRAIT_DIPLOMATIC_QUARTER_BUILDINGS_PRODUCTION');
-- INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- ('TRAIT_DIPLOMATIC_QUARTER_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, 0, NULL, NULL),
-- ('TRAIT_DIPLOMATIC_QUARTER_BUILDINGS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, 0, NULL, NULL);
-- INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
-- ('TRAIT_DIPLOMATIC_QUARTER_PRODUCTION', 'DistrictType', 'DISTRICT_DIPLOMATIC_QUARTER'), 
-- ('TRAIT_DIPLOMATIC_QUARTER_PRODUCTION', 'Amount', '100'),
-- ('TRAIT_DIPLOMATIC_QUARTER_BUILDINGS_PRODUCTION', 'DistrictType', 'DISTRICT_DIPLOMATIC_QUARTER');

--LV2 Government grant MONUMENT YIELD

-- INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES 
-- ('TRAJANS_COLUMN_TRAIT', 'TRAIT_CIVIC_DIVINE_RIGHT_MONUMENT_MORE_PRODUCTION'),
-- ('TRAJANS_COLUMN_TRAIT', 'TRAIT_CIVIC_EXPLORATION_MONUMENT_MORE_GOLD'),
-- ('TRAJANS_COLUMN_TRAIT', 'TRAIT_CIVIC_REFORMED_CHURCH_MONUMENT_MORE_FAITH');
-- INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- ('TRAIT_CIVIC_DIVINE_RIGHT_MONUMENT_MORE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, 'REQUIREMENT_PLAYER_HAS_CIVIC_DIVINE_RIGHT'),
-- ('TRAIT_CIVIC_EXPLORATION_MONUMENT_MORE_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, 'REQUIREMENT_PLAYER_HAS_CIVIC_EXPLORATION'),
-- ('TRAIT_CIVIC_REFORMED_CHURCH_MONUMENT_MORE_FAITH', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, 'REQUIREMENT_PLAYER_HAS_CIVIC_REFORMED_CHURCH');
-- INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
-- ('TRAIT_CIVIC_DIVINE_RIGHT_MONUMENT_MORE_PRODUCTION', 'BuildingType', 'BUILDING_MONUMENT'), 
-- ('TRAIT_CIVIC_DIVINE_RIGHT_MONUMENT_MORE_PRODUCTION', 'Amount', '2'), 
-- ('TRAIT_CIVIC_DIVINE_RIGHT_MONUMENT_MORE_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
-- ('TRAIT_CIVIC_EXPLORATION_MONUMENT_MORE_GOLD', 'BuildingType', 'BUILDING_MONUMENT'), 
-- ('TRAIT_CIVIC_EXPLORATION_MONUMENT_MORE_GOLD', 'Amount', '4'), 
-- ('TRAIT_CIVIC_EXPLORATION_MONUMENT_MORE_GOLD', 'YieldType', 'YIELD_GOLD'),
-- ('TRAIT_CIVIC_REFORMED_CHURCH_MONUMENT_MORE_FAITH', 'BuildingType', 'BUILDING_MONUMENT'), 
-- ('TRAIT_CIVIC_REFORMED_CHURCH_MONUMENT_MORE_FAITH', 'Amount', '2'), 
-- ('TRAIT_CIVIC_REFORMED_CHURCH_MONUMENT_MORE_FAITH', 'YieldType', 'YIELD_FAITH');

-- INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
-- ('REQUIREMENT_PLAYER_HAS_CIVIC_DIVINE_RIGHT', 'REQUIREMENTSET_TEST_ALL'),
-- ('REQUIREMENT_PLAYER_HAS_CIVIC_EXPLORATION', 'REQUIREMENTSET_TEST_ALL'),
-- ('REQUIREMENT_PLAYER_HAS_CIVIC_REFORMED_CHURCH', 'REQUIREMENTSET_TEST_ALL');
-- INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
-- ('REQUIREMENT_PLAYER_HAS_CIVIC_DIVINE_RIGHT', 'PLAYER_HAS_CIVIC_DIVINE_RIGHT'),
-- ('REQUIREMENT_PLAYER_HAS_CIVIC_EXPLORATION', 'PLAYER_HAS_CIVIC_EXPLORATION'),
-- ('REQUIREMENT_PLAYER_HAS_CIVIC_REFORMED_CHURCH', 'PLAYER_HAS_CIVIC_REFORMED_CHURCH');
-- INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
-- ('PLAYER_HAS_CIVIC_DIVINE_RIGHT', 'REQUIREMENT_PLAYER_HAS_CIVIC'),
-- ('PLAYER_HAS_CIVIC_EXPLORATION', 'REQUIREMENT_PLAYER_HAS_CIVIC'),
-- ('PLAYER_HAS_CIVIC_REFORMED_CHURCH', 'REQUIREMENT_PLAYER_HAS_CIVIC');
-- INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
-- ('PLAYER_HAS_CIVIC_DIVINE_RIGHT', 'CivicType', 'CIVIC_DIVINE_RIGHT'),
-- ('PLAYER_HAS_CIVIC_EXPLORATION', 'CivicType', 'CIVIC_EXPLORATION'),
-- ('PLAYER_HAS_CIVIC_REFORMED_CHURCH', 'CivicType', 'CIVIC_REFORMED_CHURCH');