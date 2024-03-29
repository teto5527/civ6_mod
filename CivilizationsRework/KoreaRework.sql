--Korea
--v1.0
INSERT OR REPLACE INTO Improvement_YieldChanges(ImprovementType, YieldType, YieldChange) VALUES
('IMPROVEMENT_QUARRY', 'YIELD_SCIENCE', 0);
INSERT OR REPLACE INTO Improvement_Adjacencies(ImprovementType, YieldChangeId) VALUES
('IMPROVEMENT_QUARRY', 'Quarry_ScienceSeowonAdjacency');
INSERT OR REPLACE INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, AdjacentDistrict) VALUES
('Quarry_ScienceSeowonAdjacency', 'Placeholder', 'YIELD_SCIENCE', 1, 'DISTRICT_SEOWON');

--v2.0
-- UPDATE Traits SET Description = 'LOC_TRAIT_CIVILIZATION_THREE_KINGDOMS_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_CIVILIZATION_THREE_KINGDOMS';
-- DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_CIVILIZATION_THREE_KINGDOMS';

-- INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES 
-- ('TRAIT_CIVILIZATION_THREE_KINGDOMS', 'TRAIT_SEOWON_JUNGLE_SCIENCE'),
-- ('TRAIT_CIVILIZATION_THREE_KINGDOMS', 'TRAIT_SEOWON_FOREST_CULTURE');
-- INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- ('TRAIT_SEOWON_JUNGLE_SCIENCE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, 0, NULL, 'PLOT_HAS_FOREST_ADJUST_SEOWON'),
-- ('TRAIT_SEOWON_FOREST_CULTURE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, 0, NULL, 'PLOT_HAS_JUNGLE_ADJUST_SEOWON');
-- INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
-- ('TRAIT_SEOWON_JUNGLE_SCIENCE', 'Amount', '1'),
-- ('TRAIT_SEOWON_JUNGLE_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
-- ('TRAIT_SEOWON_FOREST_CULTURE', 'Amount', '1'),
-- ('TRAIT_SEOWON_FOREST_CULTURE', 'YieldType', 'YIELD_CULTURE');

-- INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
-- ('PLOT_HAS_FOREST_ADJUST_SEOWON', 'REQUIREMENTSET_TEST_ALL'),
-- ('PLOT_HAS_JUNGLE_ADJUST_SEOWON', 'REQUIREMENTSET_TEST_ALL');
-- INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
-- ('PLOT_HAS_FOREST_ADJUST_SEOWON', 'PLOT_IS_FOREST_REQUIREMENT'),
-- ('PLOT_HAS_FOREST_ADJUST_SEOWON', 'PLOT_IS_ADJUST_SEOWON'),
-- ('PLOT_HAS_JUNGLE_ADJUST_SEOWON', 'PLOT_IS_JUNGLE_REQUIREMENT'),
-- ('PLOT_HAS_JUNGLE_ADJUST_SEOWON', 'PLOT_IS_ADJUST_SEOWON');
-- INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
-- ('PLOT_IS_ADJUST_SEOWON', 'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES');
-- INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
-- ('PLOT_IS_ADJUST_SEOWON', 'DistrictType', 'DISTRICT_SEOWON'),
-- ('PLOT_IS_ADJUST_SEOWON', 'MinRange', '0');