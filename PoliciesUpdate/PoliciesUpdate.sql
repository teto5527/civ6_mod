--Text
UPDATE Policies SET Description = 'LOC_POLICY_FREE_MARKET_DESCRIPTION_ZJ' WHERE PolicyType = 'POLICY_FREE_MARKET';
UPDATE Policies SET Description = 'LOC_POLICY_RATIONALISM_DESCRIPTION_ZJ' WHERE PolicyType = 'POLICY_RATIONALISM';
UPDATE Policies SET Description = 'LOC_POLICY_SIMULTANEUM_DESCRIPTION_ZJ' WHERE PolicyType = 'POLICY_SIMULTANEUM';
UPDATE Policies SET Description = 'LOC_POLICY_GRAND_OPERA_DESCRIPTION_ZJ' WHERE PolicyType = 'POLICY_GRAND_OPERA';
UPDATE Policies SET Description = 'LOC_POLICY_VETERANCY_DESCRIPTION_ZJ' WHERE PolicyType = 'POLICY_VETERANCY';
UPDATE Policies SET Description='LOC_POLICY_LIBERALISM_DESCRIPTION_ZJ' WHERE PolicyType='POLICY_LIBERALISM';

UPDATE Policies SET PrereqCivic = 'CIVIC_MILITARY_TRADITION' WHERE PolicyType = 'POLICY_VETERANCY';

INSERT OR REPLACE INTO PolicyModifiers (PolicyType, ModifierId) VALUES
('POLICY_FREE_MARKET', 'FREEMARKET_HARBOR_BUILDING_YIELDS_HIGH_ADJACENCY'), --free market policy also includes harbor
('POLICY_FREE_MARKET', 'FREEMARKET_HARBOR_BUILDING_YIELDS_HIGH_POP'), 

('POLICY_VETERANCY', 'VETERANCY_AERODROME_PRODUCTION'), --VETERANCY ALSO +30% PRODUCTION towards AERODROME
('POLICY_VETERANCY', 'VETERANCY_AERODROME_BUILDINGS_PRODUCTION');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
('FREEMARKET_HARBOR_BUILDING_YIELDS_HIGH_ADJACENCY', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_MODIFIERS_FOR_DISTRICT', 0, 0, 0, NULL, 'HARBOR_HAS_HIGH_ADJACENCY'),
('FREEMARKET_HARBOR_BUILDING_YIELDS_HIGH_POP', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_MODIFIERS_FOR_DISTRICT', 0, 0, 0, NULL, 'CITY_HAS_HIGH_POPULATION'),

('VETERANCY_AERODROME_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, 0, NULL, NULL),
('VETERANCY_AERODROME_BUILDINGS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, 0, NULL, NULL);

INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('FREEMARKET_HARBOR_BUILDING_YIELDS_HIGH_ADJACENCY', 'DistrictType', 'DISTRICT_HARBOR'),
('FREEMARKET_HARBOR_BUILDING_YIELDS_HIGH_ADJACENCY', 'YieldType', 'YIELD_PRODUCTION'),
('FREEMARKET_HARBOR_BUILDING_YIELDS_HIGH_ADJACENCY', 'Amount', '50'),
('FREEMARKET_HARBOR_BUILDING_YIELDS_HIGH_POP', 'DistrictType', 'DISTRICT_HARBOR'),
('FREEMARKET_HARBOR_BUILDING_YIELDS_HIGH_POP', 'YieldType', 'YIELD_PRODUCTION'),
('FREEMARKET_HARBOR_BUILDING_YIELDS_HIGH_POP', 'Amount', '50'),

('VETERANCY_AERODROME_PRODUCTION', 'DistrictType', 'DISTRICT_AERODROME'),
('VETERANCY_AERODROME_PRODUCTION', 'Amount', '30'),
('VETERANCY_AERODROME_BUILDINGS_PRODUCTION', 'DistrictType', 'DISTRICT_AERODROME'),
('VETERANCY_AERODROME_BUILDINGS_PRODUCTION', 'Amount', '30');

--INTERNATIONAL_SPACE_AGENCY Aerodrome also +15% production to space projects
INSERT OR REPLACE INTO Policies (PolicyType, Description, PrereqCivic, Name, GovernmentSlotType) VALUES	
('POLICY_INTEGRATED_SPACE_CELL', 'LOC_POLICY_INTEGRATED_SPACE_CELL_DESCRIPTION_ZJ', 'CIVIC_SPACE_RACE', 'LOC_POLICY_INTEGRATED_SPACE_CELL_NAME', 'SLOT_MILITARY');
UPDATE Modifiers SET SubjectRequirementSetId = 'CITY_HAS_MILITARY_ACADEMY_OR_SEAPORT_OR_AERODROME' WHERE ModifierId = 'INTEGRATEDSPACECELL_SPACE_RACE_PROJECTS_PRODUCTION';

INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('HARBOR_HAS_HIGH_ADJACENCY', 'REQUIRES_HARBOR_HAS_HIGH_ADJACENCY'),
('CITY_HAS_MILITARY_ACADEMY_OR_SEAPORT_OR_AERODROME', 'REQUIRES_CITY_HAS_MILITARY_ACADEMY'),
('CITY_HAS_MILITARY_ACADEMY_OR_SEAPORT_OR_AERODROME', 'REQUIRES_CITY_HAS_SEAPORT'),
('CITY_HAS_MILITARY_ACADEMY_OR_SEAPORT_OR_AERODROME', 'REQUIRES_CITY_HAS_HANGAR');
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('HARBOR_HAS_HIGH_ADJACENCY', 'REQUIREMENTSET_TEST_ALL'),
('CITY_HAS_MILITARY_ACADEMY_OR_SEAPORT_OR_AERODROME', 'REQUIREMENTSET_TEST_ALL');
INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType) VALUES	
('REQUIRES_HARBOR_HAS_HIGH_ADJACENCY', 'REQUIREMENT_CITY_HAS_HIGH_ADJACENCY_DISTRICT'),
('REQUIRES_CITY_HAS_HANGAR', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value) VALUES 
('REQUIRES_HARBOR_HAS_HIGH_ADJACENCY', 'DistrictType', 'DISTRICT_HARBOR'),
('REQUIRES_HARBOR_HAS_HIGH_ADJACENCY', 'YieldType', 'YIELD_GOLD'),
('REQUIRES_HARBOR_HAS_HIGH_ADJACENCY', 'Amount', '4'),
('REQUIRES_CITY_HAS_HANGAR', 'BuildingType', 'BUILDING_HANGAR');

--Enlightenment policies now need 10 population
UPDATE RequirementArguments SET Value=10 WHERE RequirementId='REQUIRES_CITY_HAS_HIGH_POPULATION';

--move simultaneum from reformed church to enlightenment
UPDATE Policies SET PrereqCivic = 'CIVIC_THE_ENLIGHTENMENT' WHERE PolicyType = 'POLICY_SIMULTANEUM';

--[new policy]
UPDATE ObsoletePolicies SET ObsoletePolicy='POLICY_LIBERALISM' WHERE PolicyType='POLICY_URBAN_PLANNING';
INSERT INTO PolicyModifiers (PolicyType, ModifierId) VALUES
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_BARRACKS_FOOD'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_BARRACKS_PRODUCTION'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_BASILIKOI_PAIDES_FOOD'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_BASILIKOI_PAIDES_PRODUCTION'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_STABLE_FOOD'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_STABLE_PRODUCTION'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_ORDU_FOOD'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_ORDU_PRODUCTION'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_ARMORY_FOOD'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_ARMORY_PRODUCTION'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_MILITARY_ACADEMY_FOOD'),
('POLICY_MILITARY_RECLAMATION', 'MILITARY_RECLAMATION_MILITARY_ACADEMY_PRODUCTION'),

('POLICY_URBAN_RENEWAL', 'URBAN_RENEWAL_CITY_CENTER_BUILDING_PRODUCTION'),

('POLICY_LIBERALISM', 'LIBERALISM_ALLCITYPRODUCTION'),
('POLICY_LIBERALISM', 'LIBERALISM_ALLCITYFOOD'),

('POLICY_RELIGIOUS_INDUSTRIALIZATION', 'RELIGIOUS_INDUSTRIALIZATION_INDUSTRIAL_ZONE_BUILDINGS_FAITH'),

('POLICY_SCI_TECH_PROSPERITY', 'SCI_TECH_PROSPERITY_PRODUCTION_BONUS'),
('POLICY_SCI_TECH_PROSPERITY', 'SCI_TECH_PROSPERITY_LIBRARY_NO_BASE_SCIENCE'),
('POLICY_SCI_TECH_PROSPERITY', 'SCI_TECH_PROSPERITY_UNIVERSITY_NO_BASE_SCIENCE'),
('POLICY_SCI_TECH_PROSPERITY', 'SCI_TECH_PROSPERITY_MADRASA_NO_BASE_SCIENCE'),
('POLICY_SCI_TECH_PROSPERITY', 'SCI_TECH_PROSPERITY_NAVIGATION_SCHOOL_NO_BASE_SCIENCE'),
('POLICY_SCI_TECH_PROSPERITY', 'SCI_TECH_PROSPERITY_ALCHEMICAL_SOCIETY_NO_BASE_SCIENCE'),
('POLICY_SCI_TECH_PROSPERITY', 'SCI_TECH_PROSPERITY_RESEARCH_LAB_NO_BASE_SCIENCE');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('MILITARY_RECLAMATION_BARRACKS_FOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_BARRACKS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_BASILIKOI_PAIDES_FOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_BASILIKOI_PAIDES_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_STABLE_FOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_STABLE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_ORDU_FOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_ORDU_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_ARMORY_FOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_ARMORY_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_MILITARY_ACADEMY_FOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
('MILITARY_RECLAMATION_MILITARY_ACADEMY_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),

('URBAN_RENEWAL_CITY_CENTER_BUILDING_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', NULL),

('LIBERALISM_ALLCITYPRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', NULL),
('LIBERALISM_ALLCITYFOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', NULL),

('RELIGIOUS_INDUSTRIALIZATION_INDUSTRIAL_ZONE_BUILDINGS_FAITH', 'MODIFIER_PLAYER_CITIES_ENABLE_BUILDING_FAITH_PURCHASE', NULL),

('SCI_TECH_PROSPERITY_PRODUCTION_BONUS', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', NULL),
('SCI_TECH_PROSPERITY_LIBRARY_NO_BASE_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_MODIFIER', NULL),
('SCI_TECH_PROSPERITY_UNIVERSITY_NO_BASE_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_MODIFIER', NULL),
('SCI_TECH_PROSPERITY_MADRASA_NO_BASE_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_MODIFIER', NULL),
('SCI_TECH_PROSPERITY_NAVIGATION_SCHOOL_NO_BASE_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_MODIFIER', NULL),
('SCI_TECH_PROSPERITY_RESEARCH_LAB_NO_BASE_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_MODIFIER', NULL);

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) --启用秘密结社模式时
SELECT 'SCI_TECH_PROSPERITY_ALCHEMICAL_SOCIETY_NO_BASE_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_MODIFIER', NULL
WHERE EXISTS (SELECT 1 FROM Buildings WHERE BuildingType = 'BUILDING_ALCHEMICAL_SOCIETY');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('MILITARY_RECLAMATION_BARRACKS_FOOD', 'YieldType', 'YIELD_FOOD'),
('MILITARY_RECLAMATION_BARRACKS_FOOD', 'Amount', '2'),
('MILITARY_RECLAMATION_BARRACKS_FOOD', 'BuildingType', 'BUILDING_BARRACKS'),
('MILITARY_RECLAMATION_BARRACKS_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
('MILITARY_RECLAMATION_BARRACKS_PRODUCTION', 'Amount', '2'),
('MILITARY_RECLAMATION_BARRACKS_PRODUCTION', 'BuildingType', 'BUILDING_BARRACKS'),
('MILITARY_RECLAMATION_BASILIKOI_PAIDES_FOOD', 'YieldType', 'YIELD_FOOD'),
('MILITARY_RECLAMATION_BASILIKOI_PAIDES_FOOD', 'Amount', '2'),
('MILITARY_RECLAMATION_BASILIKOI_PAIDES_FOOD', 'BuildingType', 'BUILDING_BASILIKOI_PAIDES'),
('MILITARY_RECLAMATION_BASILIKOI_PAIDES_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
('MILITARY_RECLAMATION_BASILIKOI_PAIDES_PRODUCTION', 'Amount', '2'),
('MILITARY_RECLAMATION_BASILIKOI_PAIDES_PRODUCTION', 'BuildingType', 'BUILDING_BASILIKOI_PAIDES'),
('MILITARY_RECLAMATION_STABLE_FOOD', 'YieldType', 'YIELD_FOOD'),
('MILITARY_RECLAMATION_STABLE_FOOD', 'Amount', '2'),
('MILITARY_RECLAMATION_STABLE_FOOD', 'BuildingType', 'BUILDING_STABLE'),
('MILITARY_RECLAMATION_STABLE_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
('MILITARY_RECLAMATION_STABLE_PRODUCTION', 'Amount', '2'),
('MILITARY_RECLAMATION_STABLE_PRODUCTION', 'BuildingType', 'BUILDING_STABLE'),
('MILITARY_RECLAMATION_ORDU_FOOD', 'YieldType', 'YIELD_FOOD'),
('MILITARY_RECLAMATION_ORDU_FOOD', 'Amount', '2'),
('MILITARY_RECLAMATION_ORDU_FOOD', 'BuildingType', 'BUILDING_ORDU'),
('MILITARY_RECLAMATION_ORDU_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
('MILITARY_RECLAMATION_ORDU_PRODUCTION', 'Amount', '2'),
('MILITARY_RECLAMATION_ORDU_PRODUCTION', 'BuildingType', 'BUILDING_ORDU'),
('MILITARY_RECLAMATION_ARMORY_FOOD', 'YieldType', 'YIELD_FOOD'),
('MILITARY_RECLAMATION_ARMORY_FOOD', 'Amount', '2'),
('MILITARY_RECLAMATION_ARMORY_FOOD', 'BuildingType', 'BUILDING_ARMORY'),
('MILITARY_RECLAMATION_ARMORY_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
('MILITARY_RECLAMATION_ARMORY_PRODUCTION', 'Amount', '2'),
('MILITARY_RECLAMATION_ARMORY_PRODUCTION', 'BuildingType', 'BUILDING_ARMORY'),
('MILITARY_RECLAMATION_MILITARY_ACADEMY_FOOD', 'YieldType', 'YIELD_FOOD'),
('MILITARY_RECLAMATION_MILITARY_ACADEMY_FOOD', 'Amount', '2'),
('MILITARY_RECLAMATION_MILITARY_ACADEMY_FOOD', 'BuildingType', 'BUILDING_MILITARY_ACADEMY'),
('MILITARY_RECLAMATION_MILITARY_ACADEMY_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
('MILITARY_RECLAMATION_MILITARY_ACADEMY_PRODUCTION', 'Amount', '2'),
('MILITARY_RECLAMATION_MILITARY_ACADEMY_PRODUCTION', 'BuildingType', 'BUILDING_MILITARY_ACADEMY'),

('URBAN_RENEWAL_CITY_CENTER_BUILDING_PRODUCTION', 'DistrictType', 'DISTRICT_CITY_CENTER'),
('URBAN_RENEWAL_CITY_CENTER_BUILDING_PRODUCTION', 'Amount', '35'),

('LIBERALISM_ALLCITYPRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
('LIBERALISM_ALLCITYPRODUCTION', 'Amount', '1'),
('LIBERALISM_ALLCITYFOOD', 'YieldType', 'YIELD_FOOD'),
('LIBERALISM_ALLCITYFOOD', 'Amount', '1'),

('RELIGIOUS_INDUSTRIALIZATION_INDUSTRIAL_ZONE_BUILDINGS_FAITH', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE'),

('SCI_TECH_PROSPERITY_PRODUCTION_BONUS', 'Amount', '50'),
('SCI_TECH_PROSPERITY_PRODUCTION_BONUS', 'DistrictType', 'DISTRICT_CAMPUS'),
('SCI_TECH_PROSPERITY_LIBRARY_NO_BASE_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('SCI_TECH_PROSPERITY_LIBRARY_NO_BASE_SCIENCE', 'Amount', '-100'),
('SCI_TECH_PROSPERITY_LIBRARY_NO_BASE_SCIENCE', 'BuildingType', 'BUILDING_LIBRARY'),
('SCI_TECH_PROSPERITY_UNIVERSITY_NO_BASE_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('SCI_TECH_PROSPERITY_UNIVERSITY_NO_BASE_SCIENCE', 'Amount', '-100'),
('SCI_TECH_PROSPERITY_UNIVERSITY_NO_BASE_SCIENCE', 'BuildingType', 'BUILDING_UNIVERSITY'),
('SCI_TECH_PROSPERITY_MADRASA_NO_BASE_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('SCI_TECH_PROSPERITY_MADRASA_NO_BASE_SCIENCE', 'Amount', '-100'),
('SCI_TECH_PROSPERITY_MADRASA_NO_BASE_SCIENCE', 'BuildingType', 'BUILDING_MADRASA'),
('SCI_TECH_PROSPERITY_NAVIGATION_SCHOOL_NO_BASE_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('SCI_TECH_PROSPERITY_NAVIGATION_SCHOOL_NO_BASE_SCIENCE', 'Amount', '-100'),
('SCI_TECH_PROSPERITY_NAVIGATION_SCHOOL_NO_BASE_SCIENCE', 'BuildingType', 'BUILDING_NAVIGATION_SCHOOL'),
('SCI_TECH_PROSPERITY_ALCHEMICAL_SOCIETY_NO_BASE_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('SCI_TECH_PROSPERITY_ALCHEMICAL_SOCIETY_NO_BASE_SCIENCE', 'Amount', '-100'),
('SCI_TECH_PROSPERITY_NAVIGATION_SCHOOL_NO_BASE_SCIENCE', 'BuildingType', 'BUILDING_ALCHEMICAL_SOCIETY'),
('SCI_TECH_PROSPERITY_RESEARCH_LAB_NO_BASE_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('SCI_TECH_PROSPERITY_RESEARCH_LAB_NO_BASE_SCIENCE', 'Amount', '-100'),
('SCI_TECH_PROSPERITY_RESEARCH_LAB_NO_BASE_SCIENCE', 'BuildingType', 'BUILDING_RESEARCH_LAB');

