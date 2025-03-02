UPDATE GreatPersonIndividuals SET ActionEffectTextOverride = 'MIMAR_SINAN_DESCRIPTION_ZJ' WHERE GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MIMAR_SINAN';

UPDATE GreatPersonIndividuals SET ActionCharges = 2 WHERE GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MIMAR_SINAN';

INSERT OR REPLACE INTO GreatPersonIndividualActionModifiers (GreatPersonIndividualType, ModifierId, AttachmentTargetType) VALUES
('GREAT_PERSON_INDIVIDUAL_MIMAR_SINAN', 'GREATPERSON_INDUSTRIAL_ZONE_ADJACENCY_AS_SCIENCE', 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');


INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('GREATPERSON_INDUSTRIAL_ZONE_ADJACENCY_AS_SCIENCE', 'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS', NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('GREATPERSON_INDUSTRIAL_ZONE_ADJACENCY_AS_SCIENCE', 'YieldTypeToMirror', 'YIELD_PRODUCTION'),
('GREATPERSON_INDUSTRIAL_ZONE_ADJACENCY_AS_SCIENCE', 'YieldTypeToGrant', 'YIELD_SCIENCE');