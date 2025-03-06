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
insert into BuildingModifiers (BuildingType,ModifierId)
    select 	BuildingType ,'TRAIT_WONDER_EXTRA_TRADE_ROUTE_CAPACITY_MODIFIER' from Buildings where IsWonder = 1 and ObsoleteEra = 'ERA_MEDIEVAL'; 
insert into BuildingModifiers (BuildingType,ModifierId)
    select 	BuildingType ,'TRAIT_FREE_TRADEER_AFTER_FININSHING_WONDER_MODIFIER' from Buildings where IsWonder = 1 and ObsoleteEra = 'ERA_MEDIEVAL'; 


INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_WONDER_EXTRA_TRADE_ROUTE_CAPACITY_MODIFIER', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 1, 0, 0, NULL, 'PLAYER_IS_EGYPT'),
('TRAIT_FREE_TRADEER_AFTER_FININSHING_WONDER_MODIFIER', 'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY', 1, 0, 0, NULL, 'PLAYER_IS_EGYPT');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_WONDER_EXTRA_TRADE_ROUTE_CAPACITY_MODIFIER', 'Amount', '1'),
('TRAIT_FREE_TRADEER_AFTER_FININSHING_WONDER_MODIFIER', 'UnitType', 'UNIT_TRADER'),
('TRAIT_FREE_TRADEER_AFTER_FININSHING_WONDER_MODIFIER', 'Amount', '1');

-- Requirement
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('PLAYER_IS_EGYPT', 'REQUIRES_PLAYER_IS_EGYPT');
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,RequirementSetType) values
('PLAYER_IS_EGYPT', 'REQUIREMENTSET_TEST_ALL');
INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType) VALUES 
('REQUIRES_PLAYER_IS_EGYPT', 'REQUIREMENT_PLAYER_TYPE_MATCHES');
INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('REQUIRES_PLAYER_IS_EGYPT', 'CivilizationType', 'CIVILIZATION_EGYPT');