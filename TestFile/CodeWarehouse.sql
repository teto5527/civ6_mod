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

-- able to see resource earlier
-- INSERT INTO TraitModifiers(TraitType, ModifierId) VALUES
-- ('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION', 'TRAIT_REVEAL_IRON'),
-- ('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION', 'TRAIT_REVEAL_NITER');
-- INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- ('TRAIT_REVEAL_IRON', 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 0, 0, 0, NULL, NULL),
-- ('TRAIT_REVEAL_NITER', 'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY', 0, 0, 0, NULL, 'REQUIREMENT_PLAYER_HAS_TECH_APPRENTICESHIP');
-- INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
-- ('TRAIT_REVEAL_IRON', 'ResourceType', 'RESOURCE_IRON'),
-- ('TRAIT_REVEAL_NITER', 'ResourceType', 'RESOURCE_NITER');

-- INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
-- ('REQUIREMENT_PLAYER_HAS_TECH_APPRENTICESHIP', 'REQUIREMENTSET_TEST_ALL');
-- INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
-- ('REQUIREMENT_PLAYER_HAS_TECH_APPRENTICESHIP', 'PLAYER_HAS_TECH_APPRENTICESHIP');
-- INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType) VALUES 
-- ('PLAYER_HAS_TECH_APPRENTICESHIP', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
-- INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value) VALUES 
-- ('PLAYER_HAS_TECH_APPRENTICESHIP', 'TechnologyType', 'TECH_APPRENTICESHIP');




-- --Rome
-- --trade route to the capital +1 food and production GAME_IS_ERA_CLASSICAL +2, GAME_IS_ERA_RENAISSANCE +3
-- -- INSERT INTO Type (Type, Kind) VALUES ('REQUIREMENT_TRADE_ROUTE_DESTINATION_IS_CAPITAL', 'KIND_REQUIREMENT');

-- INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
-- ('TRAIT_CIVILIZATION_ALL_ROADS_TO_ROME', 'TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_FOOD'),
-- ('TRAIT_CIVILIZATION_ALL_ROADS_TO_ROME', 'TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_PRODUCTION'),
-- ('TRAIT_CIVILIZATION_ALL_ROADS_TO_ROME', 'TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_FOOD_CLASSICAL'),
-- ('TRAIT_CIVILIZATION_ALL_ROADS_TO_ROME', 'TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_PRODUCTION_CLASSICAL');
-- INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_FOOD', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC', 0, 1, 0, NULL, NULL),
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_PRODUCTION', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC', 0, 1, 0, NULL, NULL),
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_FOOD_CLASSICAL', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC', 0, 1, 0, NULL, 'GAME_ATLEAST_ERA_CLASSICAL'),
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_PRODUCTION_CLASSICAL', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC', 0, 1, 0, NULL, 'GAME_ATLEAST_ERA_CLASSICAL');
-- INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_FOOD', 'Amount', '1'), 
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_FOOD', 'YieldType', 'YIELD_FOOD'),
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_PRODUCTION', 'Amount', '1'), 
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_FOOD_CLASSICAL', 'Amount', '1'), 
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_FOOD_CLASSICAL', 'YieldType', 'YIELD_FOOD'),
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_PRODUCTION_CLASSICAL', 'Amount', '1'), 
-- ('TRAIT_TRADE_ROUTE_TO_CAPITAL_ADEJUST_PRODUCTION_CLASSICAL', 'YieldType', 'YIELD_PRODUCTION');

-- -- INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
-- -- ('TRAJANS_COLUMN_TRAIT', 'TRAIT_TRAJANS_COLUMN_CULTURE_PER_ERA');
-- -- INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- -- ('TRAIT_TRAJANS_COLUMN_CULTURE_PER_ERA', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, 'GAME_IS_ERA_CLASSICAL');
-- -- INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
-- -- ('TRAIT_TRAJANS_COLUMN_CULTURE_PER_ERA', 'Amount', '1'), 
-- -- ('TRAIT_TRAJANS_COLUMN_CULTURE_PER_ERA', 'BuildingType', 'BUILDING_MONUMENT'), 
-- -- ('TRAIT_TRAJANS_COLUMN_CULTURE_PER_ERA', 'YieldType', 'YIELD_CULTURE');




-- INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
-- ('GAME_ATLEAST_ERA_CLASSICAL', 'REQUIREMENTSET_TEST_ALL'),
-- ('GAME_IS_ERA_CLASSICAL', 'REQUIREMENTSET_TEST_ALL'),
-- ('GAME_IS_ERA_MEDIEVAL', 'REQUIREMENTSET_TEST_ALL'),
-- ('GAME_IS_ERA_RENAISSANCE', 'REQUIREMENTSET_TEST_ALL'),
-- ('GAME_IS_ERA_INDUSTRIAL', 'REQUIREMENTSET_TEST_ALL'),
-- ('GAME_IS_ERA_MODERN', 'REQUIREMENTSET_TEST_ALL'),
-- ('GAME_IS_ERA_ATOMIC', 'REQUIREMENTSET_TEST_ALL'),
-- ('GAME_IS_ERA_INFORMATION', 'REQUIREMENTSET_TEST_ALL'),
-- ('GAME_IS_ERA_FUTURE', 'REQUIREMENTSET_TEST_ALL');
-- INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
-- ('GAME_ATLEAST_ERA_CLASSICAL', 'REQUIRE_GAME_ATLEAST_ERA_CLASSICAL'),
-- ('GAME_IS_ERA_CLASSICAL', 'REQUIRE_GAME_IS_ERA_CLASSICAL'),
-- ('GAME_IS_ERA_MEDIEVAL', 'REQUIRE_GAME_IS_ERA_MEDIEVAL'),
-- ('GAME_IS_ERA_RENAISSANCE', 'REQUIRE_GAME_IS_ERA_RENAISSANCE'),
-- ('GAME_IS_ERA_INDUSTRIAL', 'REQUIRE_GAME_IS_ERA_INDUSTRIAL'),
-- ('GAME_IS_ERA_MODERN', 'REQUIRE_GAME_IS_ERA_MODERN'),
-- ('GAME_IS_ERA_ATOMIC', 'REQUIRE_GAME_IS_ERA_ATOMIC'),
-- ('GAME_IS_ERA_INFORMATION', 'REQUIRE_GAME_IS_ERA_INFORMATION'),
-- ('GAME_IS_ERA_FUTURE', 'REQUIRE_GAME_IS_ERA_FUTURE');
-- INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
-- ('REQUIRE_GAME_ATLEAST_ERA_CLASSICAL', 'REQUIREMENT_GAME_ERA_ATLEAST'),
-- ('REQUIRE_GAME_IS_ERA_CLASSICAL', 'REQUIREMENT_GAME_ERA_IS'),
-- ('REQUIRE_GAME_IS_ERA_MEDIEVAL', 'REQUIREMENT_GAME_ERA_IS'),
-- ('REQUIRE_GAME_IS_ERA_RENAISSANCE', 'REQUIREMENT_GAME_ERA_IS'),
-- ('REQUIRE_GAME_IS_ERA_INDUSTRIAL', 'REQUIREMENT_GAME_ERA_IS'),
-- ('REQUIRE_GAME_IS_ERA_MODERN', 'REQUIREMENT_GAME_ERA_IS'),
-- ('REQUIRE_GAME_IS_ERA_ATOMIC', 'REQUIREMENT_GAME_ERA_IS'),
-- ('REQUIRE_GAME_IS_ERA_INFORMATION', 'REQUIREMENT_GAME_ERA_IS'),
-- ('REQUIRE_GAME_IS_ERA_FUTURE', 'REQUIREMENT_GAME_ERA_IS');
-- INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
-- ('REQUIRE_GAME_ATLEAST_ERA_CLASSICAL', 'MinGameEra', 'ERA_CLASSICAL'),
-- ('REQUIRE_GAME_IS_ERA_CLASSICAL', 'EraType', 'ERA_CLASSICAL'),
-- ('REQUIRE_GAME_IS_ERA_MEDIEVAL', 'EraType', 'ERA_MEDIEVAL'),
-- ('REQUIRE_GAME_IS_ERA_RENAISSANCE', 'EraType', 'ERA_RENAISSANCE'),
-- ('REQUIRE_GAME_IS_ERA_INDUSTRIAL', 'EraType', 'ERA_INDUSTRIAL'),
-- ('REQUIRE_GAME_IS_ERA_MODERN', 'EraType', 'ERA_MODERN'),
-- ('REQUIRE_GAME_IS_ERA_ATOMIC', 'EraType', 'ERA_ATOMIC'),
-- ('REQUIRE_GAME_IS_ERA_INFORMATION', 'EraType', 'ERA_INFORMATION'),
-- ('REQUIRE_GAME_IS_ERA_FUTURE', 'EraType', 'ERA_FUTURE');


INSERT OR REPLACE INTO TraitModifiers(TraitType, ModifierId) VALUES 
-- ('TRAIT_RADIO_ORANJE', 'TRAIT_CULTURE_AT_WAR_BONUS'),
('TRAIT_RADIO_ORANJE', 'TRAIT_GOLD_AT_PEACE_BONUS');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- ('TRAIT_CULTURE_AT_WAR_BONUS', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 0, NULL, 'OWNER_OR_ALLY_IS_AT_WAR_REQUIREMENTS'),
('TRAIT_GOLD_AT_PEACE_BONUS', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 0, NULL, 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS');

INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
-- ('TRAIT_CULTURE_AT_WAR_BONUS', 'Amount', '10'),
-- ('TRAIT_CULTURE_AT_WAR_BONUS', 'Description', 'LOC_CULTURE_AT_WAR_BONUS_ZJ'),
-- ('TRAIT_CULTURE_AT_WAR_BONUS', 'YieldType', 'YIELD_CULTURE'),
('TRAIT_GOLD_AT_PEACE_BONUS', 'Amount', '15'),
('TRAIT_GOLD_AT_PEACE_BONUS', 'Description', 'LOC_GOLD_AT_PEACE_BONUS_ZJ'),
('TRAIT_GOLD_AT_PEACE_BONUS', 'YieldType', 'YIELD_GOLD');