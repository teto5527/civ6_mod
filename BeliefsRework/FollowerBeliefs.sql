UPDATE Beliefs SET Description = 'LOC_BELIEF_JESUIT_EDUCATION_DESCRIPTION_ZJ' WHERE BeliefType = 'BELIEF_JESUIT_EDUCATION';
UPDATE Beliefs SET Description='LOC_BELIEF_ZEN_MEDITATION_DESCRIPTION_ZJ' WHERE BeliefType='BELIEF_ZEN_MEDITATION';
UPDATE Beliefs SET Description = 'LOC_BELIEF_FEED_THE_WORLD_DESCRIPTION_ZJ' WHERE BeliefType = 'BELIEF_FEED_THE_WORLD';
UPDATE Beliefs SET Description = 'LOC_BELIEF_CHORAL_MUSIC_DESCRIPTION_ZJ' WHERE BeliefType = 'BELIEF_CHORAL_MUSIC';

UPDATE ModifierArguments SET Value = '4' WHERE ModifierId = 'FEED_THE_WORLD_SHRINE_FOOD3_MODIFIER' AND Name = 'Amount';
UPDATE ModifierArguments SET Value = '4' WHERE ModifierId = 'FEED_THE_WORLD_TEMPLE_FOOD3_MODIFIER' AND Name = 'Amount';

INSERT OR REPLACE INTO BeliefModifiers (BeliefType, ModifierId) VALUES 
('BELIEF_JESUIT_EDUCATION', 'JESUIT_EDUCATION_BELIEF_BUILDINGS'),

('BELIEF_ZEN_MEDITATION', 'ZEN_MEDITATION_ADJACENCY_SCIENCE_2'),

('BELIEF_CHORAL_MUSIC', 'CHORAL_MUSIC_CATHEDRAL_CULTURE'),
('BELIEF_CHORAL_MUSIC', 'CHORAL_MUSIC_DAR_E_MEHR_CULTURE'),
('BELIEF_CHORAL_MUSIC', 'CHORAL_MUSIC_GURDWARA_CULTURE'),
('BELIEF_CHORAL_MUSIC', 'CHORAL_MUSIC_MEETING_HOUSE_CULTURE'),
('BELIEF_CHORAL_MUSIC', 'CHORAL_MUSIC_MOSQUE_CULTURE'),
('BELIEF_CHORAL_MUSIC', 'CHORAL_MUSIC_PAGODA_CULTURE'),
('BELIEF_CHORAL_MUSIC', 'CHORAL_MUSIC_STUPA_CULTURE'),
('BELIEF_CHORAL_MUSIC', 'CHORAL_MUSIC_WAT_CULTURE'),
('BELIEF_CHORAL_MUSIC', 'CHORAL_MUSIC_SYNAGOGUE_CULTURE'),
('BELIEF_CHORAL_MUSIC', 'CHORAL_MUSIC_PRASAT_EXTRA_CULTURE');

INSERT INTO GreatPersonIndividualActionModifiers (GreatPersonIndividualType, ModifierId, AttachmentTargetType) VALUES
('GREAT_PERSON_INDIVIDUAL_HILDEGARD_OF_BINGEN', 'GREATPERSON_HOLY_SITE_ADJACENCY_AS_PRODUCTION', 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('JESUIT_EDUCATION_BELIEF_BUILDINGS', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('JESUIT_EDUCATION_BELIEF_BUILDINGS_MODIFIER', 'MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE', 0, 0, 0, NULL, NULL),

('ZEN_MEDITATION_ADJACENCY_SCIENCE_2', 'MODIFIER_ALL_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS', 0, 0, 0, NULL, 'ZEN_MEDITATION_ADJACENCY_SCIENCE_REQUIREMENTS'),

('CHORAL_MUSIC_CATHEDRAL_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('CHORAL_MUSIC_CATHEDRAL_CULTURE_MODIFIER', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),
('CHORAL_MUSIC_DAR_E_MEHR_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('CHORAL_MUSIC_DAR_E_MEHR_CULTURE_MODIFIER', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),
('CHORAL_MUSIC_GURDWARA_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('CHORAL_MUSIC_GURDWARA_CULTURE_MODIFIER', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),
('CHORAL_MUSIC_MEETING_HOUSE_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('CHORAL_MUSIC_MEETING_HOUSE_CULTURE_MODIFIER', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),
('CHORAL_MUSIC_MOSQUE_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('CHORAL_MUSIC_MOSQUE_CULTURE_MODIFIER', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),
('CHORAL_MUSIC_PAGODA_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('CHORAL_MUSIC_PAGODA_CULTURE_MODIFIER', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),
('CHORAL_MUSIC_STUPA_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('CHORAL_MUSIC_STUPA_CULTURE_MODIFIER', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),
('CHORAL_MUSIC_WAT_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('CHORAL_MUSIC_WAT_CULTURE_MODIFIER', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),
('CHORAL_MUSIC_SYNAGOGUE_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('CHORAL_MUSIC_SYNAGOGUE_CULTURE_MODIFIER', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),

('CHORAL_MUSIC_PRASAT_EXTRA_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
('CHORAL_MUSIC_PRASAT_EXTRA_CULTURE_MODIFIER', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),

('GREATPERSON_HOLY_SITE_ADJACENCY_AS_PRODUCTION', 'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS', 1, 0, 1, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('JESUIT_EDUCATION_BELIEF_BUILDINGS', 'ModifierId', 'JESUIT_EDUCATION_BELIEF_BUILDINGS_MODIFIER'),
('JESUIT_EDUCATION_BELIEF_BUILDINGS_MODIFIER', 'DistrictType', 'DISTRICT_HOLY_SITE'),

('ZEN_MEDITATION_ADJACENCY_SCIENCE_2', 'YieldTypeToMirror', 'YIELD_FAITH'),
('ZEN_MEDITATION_ADJACENCY_SCIENCE_2', 'YieldTypeToGrant', 'YIELD_SCIENCE'),

('CHORAL_MUSIC_CATHEDRAL_CULTURE', 'ModifierId', 'CHORAL_MUSIC_CATHEDRAL_CULTURE_MODIFIER'),
('CHORAL_MUSIC_CATHEDRAL_CULTURE_MODIFIER', 'BuildingType', 'BUILDING_CATHEDRAL'),
('CHORAL_MUSIC_CATHEDRAL_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
('CHORAL_MUSIC_CATHEDRAL_CULTURE_MODIFIER', 'Amount', '4'),
('CHORAL_MUSIC_DAR_E_MEHR_CULTURE', 'ModifierId', 'CHORAL_MUSIC_DAR_E_MEHR_CULTURE_MODIFIER'),
('CHORAL_MUSIC_DAR_E_MEHR_CULTURE_MODIFIER', 'BuildingType', 'BUILDING_DAR_E_MEHR'),
('CHORAL_MUSIC_DAR_E_MEHR_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
('CHORAL_MUSIC_DAR_E_MEHR_CULTURE_MODIFIER', 'Amount', '4'),
('CHORAL_MUSIC_GURDWARA_CULTURE', 'ModifierId', 'CHORAL_MUSIC_GURDWARA_CULTURE_MODIFIER'),
('CHORAL_MUSIC_GURDWARA_CULTURE_MODIFIER', 'BuildingType', 'BUILDING_GURDWARA'),
('CHORAL_MUSIC_GURDWARA_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
('CHORAL_MUSIC_GURDWARA_CULTURE_MODIFIER', 'Amount', '4'),
('CHORAL_MUSIC_MEETING_HOUSE_CULTURE', 'ModifierId', 'CHORAL_MUSIC_MEETING_HOUSE_CULTURE_MODIFIER'),
('CHORAL_MUSIC_MEETING_HOUSE_CULTURE_MODIFIER', 'BuildingType', 'BUILDING_MEETING_HOUSE'),
('CHORAL_MUSIC_MEETING_HOUSE_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
('CHORAL_MUSIC_MEETING_HOUSE_CULTURE_MODIFIER', 'Amount', '4'),
('CHORAL_MUSIC_MOSQUE_CULTURE', 'ModifierId', 'CHORAL_MUSIC_MOSQUE_CULTURE_MODIFIER'),
('CHORAL_MUSIC_MOSQUE_CULTURE_MODIFIER', 'BuildingType', 'BUILDING_MOSQUE'),
('CHORAL_MUSIC_MOSQUE_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
('CHORAL_MUSIC_MOSQUE_CULTURE_MODIFIER', 'Amount', '4'),
('CHORAL_MUSIC_PAGODA_CULTURE', 'ModifierId', 'CHORAL_MUSIC_PAGODA_CULTURE_MODIFIER'),
('CHORAL_MUSIC_PAGODA_CULTURE_MODIFIER', 'BuildingType', 'BUILDING_PAGODA'),
('CHORAL_MUSIC_PAGODA_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
('CHORAL_MUSIC_PAGODA_CULTURE_MODIFIER', 'Amount', '4'),
('CHORAL_MUSIC_STUPA_CULTURE', 'ModifierId', 'CHORAL_MUSIC_STUPA_CULTURE_MODIFIER'),
('CHORAL_MUSIC_STUPA_CULTURE_MODIFIER', 'BuildingType', 'BUILDING_STUPA'),
('CHORAL_MUSIC_STUPA_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
('CHORAL_MUSIC_STUPA_CULTURE_MODIFIER', 'Amount', '4'),
('CHORAL_MUSIC_WAT_CULTURE', 'ModifierId', 'CHORAL_MUSIC_WAT_CULTURE_MODIFIER'),
('CHORAL_MUSIC_WAT_CULTURE_MODIFIER', 'BuildingType', 'BUILDING_WAT'),
('CHORAL_MUSIC_WAT_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
('CHORAL_MUSIC_WAT_CULTURE_MODIFIER', 'Amount', '4'),
('CHORAL_MUSIC_SYNAGOGUE_CULTURE', 'ModifierId', 'CHORAL_MUSIC_SYNAGOGUE_CULTURE_MODIFIER'),
('CHORAL_MUSIC_SYNAGOGUE_CULTURE_MODIFIER', 'BuildingType', 'BUILDING_SYNAGOGUE'),
('CHORAL_MUSIC_SYNAGOGUE_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
('CHORAL_MUSIC_SYNAGOGUE_CULTURE_MODIFIER', 'Amount', '6'),

('CHORAL_MUSIC_PRASAT_EXTRA_CULTURE', 'ModifierId', 'CHORAL_MUSIC_PRASAT_EXTRA_CULTURE_MODIFIER'),
('CHORAL_MUSIC_PRASAT_EXTRA_CULTURE_MODIFIER', 'BuildingType', 'BUILDING_PRASAT'),
('CHORAL_MUSIC_PRASAT_EXTRA_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
('CHORAL_MUSIC_PRASAT_EXTRA_CULTURE_MODIFIER', 'Amount', '2'),

('GREATPERSON_HOLY_SITE_ADJACENCY_AS_PRODUCTION', 'YieldTypeToMirror', 'YIELD_FAITH'),
('GREATPERSON_HOLY_SITE_ADJACENCY_AS_PRODUCTION', 'YieldTypeToGrant', 'YIELD_PRODUCTION');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES 
('ZEN_MEDITATION_ADJACENCY_SCIENCE_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES 
('ZEN_MEDITATION_ADJACENCY_SCIENCE_REQUIREMENTS', 'REQUIRES_ZEN_MEDITATION_DISTRICT_IS_HOLY_SITE');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES 
('REQUIRES_ZEN_MEDITATION_DISTRICT_IS_HOLY_SITE', 'REQUIREMENT_PLOT_DISTRICT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('REQUIRES_ZEN_MEDITATION_DISTRICT_IS_HOLY_SITE', 'DistrictType', 'DISTRICT_HOLY_SITE');


