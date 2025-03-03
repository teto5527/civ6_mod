UPDATE Improvements SET Description = 'LOC_IMPROVEMENT_SPHINX_DESCRIPTION_ZJ' WHERE ImprovementType = 'IMPROVEMENT_SPHINX';
UPDATE Traits SET Description = 'LOC_TRAIT_CIVILIZATION_ITERU_EXPANSION2_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_CIVILIZATION_ITERU';

--Sphinx buffed
UPDATE Improvement_YieldChanges SET YieldChange = 2 WHERE ImprovementType = 'IMPROVEMENT_SPHINX' AND YieldType = 'YIELD_FAITH';
UPDATE Improvement_BonusYieldChanges SET BonusYieldChange = 2 WHERE ImprovementType = 'IMPROVEMENT_SPHINX' AND YieldType = 'YIELD_CULTURE';

INSERT INTO ImprovementModifiers (ImprovementType, ModifierId) VALUES
('IMPROVEMENT_SPHINX', 'SPHINX_WONDERADJACENCY_CULTURE');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('SPHINX_WONDERADJACENCY_CULTURE', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 0, 0, 0, NULL, 'PLOT_ADJACENT_TO_WONDER_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('SPHINX_WONDERADJACENCY_CULTURE', 'YieldType', 'YIELD_CULTURE'),
('SPHINX_WONDERADJACENCY_CULTURE', 'Amount', '1');


--UA: +50% Production to wonders that next to river 
UPDATE ModifierArguments SET Value = '50' WHERE ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_WONDER';
UPDATE ModifierArguments SET Value = '0' WHERE ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_DISTRICT';

--Every wonder build at Ancient era give +1 TRADE_ROUTE_CAPACITY and a free TRADER
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
('TRAIT_CIVILIZATION_ITERU', 'TRAIT_WONDER_TRADE_CAPACITY'),
('TRAIT_CIVILIZATION_ITERU', 'TRAIT_WONDER_FREE_TRADER');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_WONDER_TRADE_CAPACITY', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 0, 0, 0, NULL, 'PLAYER_BUILT_NEW_WONDER_AND_ANCIENT'),
('TRAIT_WONDER_FREE_TRADER', 'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY', 0, 0, 0, NULL, 'PLAYER_BUILT_NEW_WONDER_AND_ANCIENT');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_WONDER_TRADE_CAPACITY', 'Amount', '1'),
('TRAIT_WONDER_FREE_TRADER', 'UnitType', 'UNIT_TRADER'),
('TRAIT_WONDER_FREE_TRADER', 'Amount', '1');

-- Requirement
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('PLAYER_BUILT_NEW_WONDER_AND_ANCIENT', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('PLAYER_BUILT_NEW_WONDER_AND_ANCIENT', 'REQUIRES_NEW_WONDER'),
('PLAYER_BUILT_NEW_WONDER_AND_ANCIENT', 'REQUIRES_ERA_IS_ANCIENT');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('REQUIRES_ERA_IS_ANCIENT', 'REQUIREMENT_GAME_ERA_IS');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('REQUIRES_ERA_IS_ANCIENT', 'EraType', 'ERA_ANCIENT');