--Text
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_VICTORIA_ALT_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_LEADER_VICTORIA_ALT';
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_ELIZABETH_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_LEADER_ELIZABETH';
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_SEJONG_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_LEADER_SEJONG';
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_SUNDIATA_KEITA_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_LEADER_SUNDIATA_KEITA';
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_TOKUGAWA_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_LEADER_TOKUGAWA';
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_NADER_SHAH_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_LEADER_NADER_SHAH';
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_LINCOLN_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_LEADER_LINCOLN';

DELETE FROM TraitModifiers WHERE TraitType='TRAIT_LEADER_SUNDIATA_KEITA';
DELETE FROM TraitModifiers WHERE TraitType='TRAIT_LEADER_NADER_SHAH';

UPDATE ModifierArguments SET Value = '3' WHERE ModifierId = 'TOKUGAWA_POSITIVE_DOMESTIC_GOLD_DISTRICTS' AND Name = 'Amount';

INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) VALUES
('TRAIT_LEADER_VICTORIA_ALT', 'TRAIT_VICTORIA_WORKSHOP_FOOD'),
('TRAIT_LEADER_VICTORIA_ALT', 'TRAIT_VICTORIA_FACTORY_FOOD'),

('TRAIT_LEADER_ELIZABETH', 'TRAIT_ELIZABETH_COAST_CITY_GOLD'),
('TRAIT_LEADER_ELIZABETH', 'TRAIT_ELIZABETH_COAST_CITY_GOLD_GOLDEN_AGE'),

-- ('TRAIT_CIVILIZATION_BYZANTIUM','TRAIT_THEODORA_CAPITAL_INCREASED_TILES'),

('TRAIT_LEADER_SEJONG','TRAIT_SEJONG_LIBRARY_GREAT_PERSON_POINT'),
('TRAIT_LEADER_SEJONG','TRAIT_SEJONG_LIBRARY_GREAT_WORK_WRITING_SLOT'),
('TRAIT_LEADER_SEJONG','TRAIT_SEJONG_GREAT_WORK_WRITING_SCIENCE'),
('TRAIT_LEADER_SEJONG','TRAIT_SEJONG_GREAT_WORK_WRITING_CULTURE'),

('TRAIT_LEADER_SUNDIATA_KEITA','TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE'),
('TRAIT_LEADER_SUNDIATA_KEITA','TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_GOLDEN_AGE'),
('TRAIT_LEADER_SUNDIATA_KEITA','TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_MARKET'),
('TRAIT_LEADER_SUNDIATA_KEITA','TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_BANK'),
('TRAIT_LEADER_SUNDIATA_KEITA','TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_STOCK_EXCHANGE'),

('TRAIT_LEADER_TOKUGAWA', 'TRAIT_TOKUGAWA_GOVERNMENT_PRODUCTION'),
('TRAIT_LEADER_TOKUGAWA', 'TRAIT_TOKUGAWA_GOVERNMENT_BUILDINGS_PRODUCTION'),
('TRAIT_LEADER_TOKUGAWA', 'TRAIT_TOKUGAWA_GOVERNMENT_EXTRA_DISTRICT'),

('TRAIT_LEADER_NADER_SHAH', 'NADER_SHAH_COMBAT_ABILITY'),
('TRAIT_LEADER_NADER_SHAH', 'TRAIT_PRODUCTION_POPULATION'),
('TRAIT_LEADER_NADER_SHAH', 'TRAIT_PRODUCTION_POPULATION_APPRENTICESHIP'),
('TRAIT_LEADER_NADER_SHAH', 'TRAIT_PRODUCTION_POPULATION_INDUSTRIALIZATION'),

('TRAIT_LEADER_WU_ZETIAN', 'TRAIT_LEADER_WU_ZETIAN_THEATER_AMENITIES'),
('TRAIT_LEADER_WU_ZETIAN', 'TRAIT_THEATER_DISTRICT_RIVER_ADJACENCY'),

('TRAIT_LEADER_LINCOLN', 'TRAIT_LINCOLN_INDUSTRIAL_ZONE_HOUSING'),
('TRAIT_LEADER_LINCOLN', 'TRAIT_LINCOLN_BOOST_INDUSTRIAL_ZONE_PRODUCTION'),
('TRAIT_LEADER_LINCOLN', 'TRAIT_LINCOLN_BOOST_INDUSTRIAL_ZONE_BUILDINGS_PRODUCTION');

INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
('TRAIT_VICTORIA_WORKSHOP_FOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),
('TRAIT_VICTORIA_FACTORY_FOOD', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL),

('TRAIT_ELIZABETH_COAST_CITY_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, 0, NULL, 'REQUIREMENT_ELIZABETH_COAST_CITY_GOLD'),
('TRAIT_ELIZABETH_COAST_CITY_GOLD_GOLDEN_AGE', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 0, 0, 0, NULL, 'REQUIREMENT_ELIZABETH_COAST_CITY_GOLD_GOLDEN_AGE'),

('TRAIT_THEODORA_CAPITAL_INCREASED_TILES', 'MODIFIER_PLAYER_ADJUST_CITY_TILES', 0, 0, 0, NULL, 'PLAYER_HAS_NO_CITIES'),

('TRAIT_SEJONG_LIBRARY_GREAT_PERSON_POINT', 'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT', 0, 0, 0, NULL, 'BUILDING_IS_LIBRARY'),
('TRAIT_SEJONG_LIBRARY_GREAT_WORK_WRITING_SLOT', 'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_GREAT_WORK_SLOTS', 0, 0, 0, NULL, NULL),
('TRAIT_SEJONG_GREAT_WORK_WRITING_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD', 0, 0, 0, NULL, NULL),
('TRAIT_SEJONG_GREAT_WORK_WRITING_CULTURE', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD', 0, 0, 0, NULL, NULL),

('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL', 0, 0, 0, NULL, NULL),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_GOLDEN_AGE', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL', 0, 0, 0, NULL, 'PLAYER_HAS_GOLDEN_AGE'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_MARKET', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, NULL),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_BANK', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, NULL),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_STOCK_EXCHANGE', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 0, 0, 0, NULL, NULL),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_MODIFIER', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL', 0, 0, 0, NULL, NULL),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_MARKET_MODIFIER', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL', 0, 0, 0, NULL, 'CITY_HAS_MARKET'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_BANK_MODIFIER', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL', 0, 0, 0, NULL, 'CITY_HAS_BANK'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_STOCK_EXCHANGE_MODIFIER', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL', 0, 0, 0, NULL, 'CITY_HAS_STOCK_EXCHANGE'),

('TRAIT_TOKUGAWA_GOVERNMENT_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, 0, NULL, NULL),
('TRAIT_TOKUGAWA_GOVERNMENT_BUILDINGS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, 0, NULL, NULL),
('TRAIT_TOKUGAWA_GOVERNMENT_EXTRA_DISTRICT', 'MODIFIER_PLAYER_CITIES_EXTRA_DISTRICT', 0, 0, 0, NULL, 'CITY_HAS_GOVERNMENT_DISTRICT'),

('TRAIT_PRODUCTION_POPULATION', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION', 0, 0, 0, NULL, 'CITY_HAS_GOVERNOR'),
('TRAIT_PRODUCTION_POPULATION_APPRENTICESHIP', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION', 0, 0, 0, NULL, 'REQUIREMENT_CITY_HAS_GOVERNOR_PLAYER_HAS_APPRENTICESHIP'),
('TRAIT_PRODUCTION_POPULATION_INDUSTRIALIZATION', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION', 0, 0, 0, NULL, 'REQUIREMENT_CITY_HAS_GOVERNOR_PLAYER_HAS_INDUSTRIALIZATION'),

('TRAIT_LEADER_WU_ZETIAN_THEATER_AMENITIES', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_DISTRICT_AMENITY', 0, 0, 0, NULL, 'DISTRICT_IS_THEATER'),

('TRAIT_LINCOLN_INDUSTRIAL_ZONE_HOUSING', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 0, 0, 0, NULL, 'DISTRICT_IS_INDUSTRIAL_ZONE'),
('TRAIT_LINCOLN_BOOST_INDUSTRIAL_ZONE_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, 0, NULL, NULL),
('TRAIT_LINCOLN_BOOST_INDUSTRIAL_ZONE_BUILDINGS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, 0, NULL, NULL);

INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES
('TRAIT_VICTORIA_WORKSHOP_FOOD', 'BuildingType', 'BUILDING_WORKSHOP'),
('TRAIT_VICTORIA_WORKSHOP_FOOD', 'Amount', '3'),
('TRAIT_VICTORIA_WORKSHOP_FOOD', 'YieldType', 'YIELD_FOOD'),
('TRAIT_VICTORIA_FACTORY_FOOD', 'BuildingType', 'BUILDING_FACTORY'),
('TRAIT_VICTORIA_FACTORY_FOOD', 'Amount', '3'),
('TRAIT_VICTORIA_FACTORY_FOOD', 'YieldType', 'YIELD_FOOD'),

('TRAIT_ELIZABETH_COAST_CITY_GOLD', 'Amount', '5'),
('TRAIT_ELIZABETH_COAST_CITY_GOLD', 'YieldType', 'YIELD_GOLD'),
('TRAIT_ELIZABETH_COAST_CITY_GOLD', 'Description', 'LOC_COAST_CITY_GOLD_DESCRIPTION'),
('TRAIT_ELIZABETH_COAST_CITY_GOLD_GOLDEN_AGE', 'Amount', '5'),
('TRAIT_ELIZABETH_COAST_CITY_GOLD_GOLDEN_AGE', 'YieldType', 'YIELD_GOLD'),
('TRAIT_ELIZABETH_COAST_CITY_GOLD_GOLDEN_AGE', 'Description', 'LOC_COAST_CITY_GOLD_DESCRIPTION'),

('TRAIT_THEODORA_CAPITAL_INCREASED_TILES', 'Amount', '12'),

('TRAIT_SEJONG_LIBRARY_GREAT_PERSON_POINT', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_WRITER'),
('TRAIT_SEJONG_LIBRARY_GREAT_PERSON_POINT', 'Amount', '1'),
('TRAIT_SEJONG_LIBRARY_GREAT_WORK_WRITING_SLOT', 'BuildingType', 'BUILDING_LIBRARY'),
('TRAIT_SEJONG_LIBRARY_GREAT_WORK_WRITING_SLOT', 'GreatWorkSlotType', 'GREATWORKSLOT_WRITING'),
('TRAIT_SEJONG_LIBRARY_GREAT_WORK_WRITING_SLOT', 'Amount', '1'),
('TRAIT_SEJONG_GREAT_WORK_WRITING_SCIENCE', 'GreatWorkObjectType', 'GREATWORKOBJECT_WRITING'),
('TRAIT_SEJONG_GREAT_WORK_WRITING_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('TRAIT_SEJONG_GREAT_WORK_WRITING_SCIENCE', 'YieldChange', '2'),
('TRAIT_SEJONG_GREAT_WORK_WRITING_CULTURE', 'GreatWorkObjectType', 'GREATWORKOBJECT_WRITING'),
('TRAIT_SEJONG_GREAT_WORK_WRITING_CULTURE', 'YieldType', 'YIELD_CULTURE'),
('TRAIT_SEJONG_GREAT_WORK_WRITING_CULTURE', 'YieldChange', '2'),

('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE', 'Amount', '2'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_GOLDEN_AGE', 'Amount', '2'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_GOLDEN_AGE', 'YieldType', 'YIELD_SCIENCE'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_MARKET', 'ModifierId', 'TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_MARKET_MODIFIER'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_BANK', 'ModifierId', 'TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_BANK_MODIFIER'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_STOCK_EXCHANGE', 'ModifierId', 'TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_STOCK_EXCHANGE_MODIFIER'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_MODIFIER', 'Amount', '2'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_MODIFIER', 'YieldType', 'YIELD_SCIENCE'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_MARKET_MODIFIER', 'Amount', '2'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_MARKET_MODIFIER', 'YieldType', 'YIELD_SCIENCE'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_BANK_MODIFIER', 'Amount', '2'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_BANK_MODIFIER', 'YieldType', 'YIELD_SCIENCE'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_STOCK_EXCHANGE_MODIFIER', 'Amount', '2'),
('TRAIT_LEADER_SUNDIATA_KEITA_TRADE_ROUTES_SCIENCE_STOCK_EXCHANGE_MODIFIER', 'YieldType', 'YIELD_SCIENCE'),

('TRAIT_TOKUGAWA_GOVERNMENT_PRODUCTION', 'DistrictType', 'DISTRICT_GOVERNMENT'),
('TRAIT_TOKUGAWA_GOVERNMENT_PRODUCTION', 'Amount', '100'),
('TRAIT_TOKUGAWA_GOVERNMENT_BUILDINGS_PRODUCTION', 'DistrictType', 'DISTRICT_GOVERNMENT'),
('TRAIT_TOKUGAWA_GOVERNMENT_BUILDINGS_PRODUCTION', 'Amount', '100'),
('TRAIT_TOKUGAWA_GOVERNMENT_EXTRA_DISTRICT', 'Amount', '1'),

('TRAIT_PRODUCTION_POPULATION', 'YieldType', 'YIELD_PRODUCTION'),
('TRAIT_PRODUCTION_POPULATION', 'Amount', '0.7'), --showing 0.6 in game
('TRAIT_PRODUCTION_POPULATION_APPRENTICESHIP', 'YieldType', 'YIELD_PRODUCTION'),
('TRAIT_PRODUCTION_POPULATION_APPRENTICESHIP', 'Amount', '0.5'), --0.4 in game
('TRAIT_PRODUCTION_POPULATION_INDUSTRIALIZATION', 'YieldType', 'YIELD_PRODUCTION'),
('TRAIT_PRODUCTION_POPULATION_INDUSTRIALIZATION', 'Amount', '0.6'),

('TRAIT_LEADER_WU_ZETIAN_THEATER_AMENITIES', 'Amount', '2'),

('TRAIT_LINCOLN_INDUSTRIAL_ZONE_HOUSING', 'Amount', '2'),
('TRAIT_LINCOLN_BOOST_INDUSTRIAL_ZONE_PRODUCTION', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE'),
('TRAIT_LINCOLN_BOOST_INDUSTRIAL_ZONE_PRODUCTION', 'Amount', '100'),
('TRAIT_LINCOLN_BOOST_INDUSTRIAL_ZONE_BUILDINGS_PRODUCTION', 'DistrictType', 'DISTRICT_INDUSTRIAL_ZONE'),
('TRAIT_LINCOLN_BOOST_INDUSTRIAL_ZONE_BUILDINGS_PRODUCTION', 'Amount', '100');

-- RequirementSets
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQUIREMENT_ELIZABETH_COAST_CITY_GOLD', 'REQUIREMENTSET_TEST_ALL'),
('REQUIREMENT_ELIZABETH_COAST_CITY_GOLD_GOLDEN_AGE', 'REQUIREMENTSET_TEST_ALL'),
('CITY_HAS_MARKET', 'REQUIREMENTSET_TEST_ALL'),
('CITY_HAS_BANK', 'REQUIREMENTSET_TEST_ALL'),
('CITY_HAS_STOCK_EXCHANGE', 'REQUIREMENTSET_TEST_ALL'),
('REQUIREMENT_CITY_HAS_GOVERNOR_PLAYER_HAS_APPRENTICESHIP', 'REQUIREMENTSET_TEST_ALL'),
('REQUIREMENT_CITY_HAS_GOVERNOR_PLAYER_HAS_INDUSTRIALIZATION', 'REQUIREMENTSET_TEST_ALL'),
('CITY_HAS_GOVERNMENT_DISTRICT', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQUIREMENT_ELIZABETH_COAST_CITY_GOLD', 'PLOT_IS_COASTAL_LAND'),
('REQUIREMENT_ELIZABETH_COAST_CITY_GOLD', 'REQUIRES_PLAYER_AT_PEACE_WITH_ALL_MAJORS'),
('REQUIREMENT_ELIZABETH_COAST_CITY_GOLD_GOLDEN_AGE', 'PLOT_IS_COASTAL_LAND'),
('REQUIREMENT_ELIZABETH_COAST_CITY_GOLD_GOLDEN_AGE', 'REQUIRES_PLAYER_AT_PEACE_WITH_ALL_MAJORS'),
('REQUIREMENT_ELIZABETH_COAST_CITY_GOLD_GOLDEN_AGE', 'REQUIRES_PLAYER_HAS_GOLDEN_AGE'),
('CITY_HAS_MARKET', 'REQUIREMENT_CITY_HAS_MARKET'),
('CITY_HAS_BANK', 'REQUIREMENT_CITY_HAS_BANK'),
('CITY_HAS_STOCK_EXCHANGE', 'REQUIREMENT_CITY_HAS_STOCK_EXCHANGE'),
('REQUIREMENT_CITY_HAS_GOVERNOR_PLAYER_HAS_APPRENTICESHIP', 'REQUIRES_CITY_HAS_GOVERNOR'),
('REQUIREMENT_CITY_HAS_GOVERNOR_PLAYER_HAS_APPRENTICESHIP', 'REQUIRES_PLAYER_HAS_TECH_APPRENTICESHIP'),
('REQUIREMENT_CITY_HAS_GOVERNOR_PLAYER_HAS_INDUSTRIALIZATION', 'REQUIRES_CITY_HAS_GOVERNOR'),
('REQUIREMENT_CITY_HAS_GOVERNOR_PLAYER_HAS_INDUSTRIALIZATION', 'REQUIRES_PLAYER_HAS_INDUSTRIALIZATION'),
('CITY_HAS_GOVERNMENT_DISTRICT', 'REQUIREMENT_CITY_HAS_GOVERNMENT_DISTRICT');

-- Requirements
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
('REQUIREMENT_CITY_HAS_MARKET', 'REQUIREMENT_CITY_HAS_BUILDING'),
('REQUIREMENT_CITY_HAS_BANK', 'REQUIREMENT_CITY_HAS_BUILDING'),
('REQUIREMENT_CITY_HAS_STOCK_EXCHANGE', 'REQUIREMENT_CITY_HAS_BUILDING'),
('REQUIREMENT_CITY_HAS_GOVERNMENT_DISTRICT', 'REQUIREMENT_CITY_HAS_DISTRICT');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQUIREMENT_CITY_HAS_MARKET', 'BuildingType', 'BUILDING_MARKET'),
('REQUIREMENT_CITY_HAS_BANK', 'BuildingType', 'BUILDING_BANK'),
('REQUIREMENT_CITY_HAS_STOCK_EXCHANGE', 'BuildingType', 'BUILDING_STOCK_EXCHANGE'),
('REQUIREMENT_CITY_HAS_GOVERNMENT_DISTRICT', 'DistrictType', 'DISTRICT_GOVERNMENT');