UPDATE Units
    SET BaseMoves=5
    WHERE UnitType='UNIT_SETTLER';




--leader_Kublai Khan 






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