-- GameData1
-- Author: zjhao
-- DateCreated: 4/29/2022 5:53:50 PM
--------------------------------------------------------------
--0.TEXT
UPDATE Buildings SET  Description = 'LOC_BUILDING_CHICHEN_ITZA_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_CHICHEN_ITZA';
UPDATE Buildings SET  Description = 'LOC_BUILDING_RUHR_VALLEY_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_RUHR_VALLEY';
UPDATE Buildings SET Description = 'LOC_BUILDING_STONEHENGE_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_STONEHENGE';
UPDATE Buildings SET Description = 'LOC_BUILDING_GREAT_LIGHTHOUSE_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_GREAT_LIGHTHOUSE';

--1.Some wonders can be built in Forest, Rainforest or mountain
-- Enable Wonders on Mountain(HD)
insert or replace into Building_ValidTerrains (BuildingType, TerrainType)
select a.BuildingType,	b.TerrainType
from Buildings a, Terrains b where
	a.BuildingType in ('BUILDING_ORACLE', 'BUILDING_POTALA_PALACE') and
	b.TerrainType like 'TERRAIN_%_MOUNTAIN';
insert or replace into Building_ValidTerrains (BuildingType, TerrainType) values 
('BUILDING_PETRA', 'TERRAIN_DESERT_MOUNTAIN'),
('BUILDING_JEBEL_BARKAL', 'TERRAIN_DESERT_MOUNTAIN');

-- Enable Wonders in Forest(not yet test)
insert or replace into Building_ValidFeatures (BuildingType, FeatureType)
select a.BuildingType,	b.FeatureType
from Buildings a, Features b where
	a.BuildingType in ('BUILDING_TEMPLE_ARTEMIS', 'BUILDING_KOTOKU_IN', 'BUILDING_GREAT_ZIMBABWE', 'BUILDING_BIOSPHERE', 'BUILDING_ANGKOR_WAT', 'BUILDING_EIFFEL_TOWER', 'BUILDING_ESTADIO_DO_MARACANA') and
	b.FeatureType='FEATURE_FOREST';

-- Enable Wonders in Jungle
insert or replace into Building_ValidFeatures (BuildingType, FeatureType)
select a.BuildingType,	b.FeatureType
from Buildings a, Features b where
	a.BuildingType in ('BUILDING_GREAT_ZIMBABWE', 'BUILDING_BIOSPHERE', 'BUILDING_ANGKOR_WAT') and
	b.FeatureType='FEATURE_JUNGLE';

--2.Wonders provides 1 Entertainment
UPDATE Buildings 
    SET Entertainment=Entertainment+1 
    WHERE IsWonder=1;

--3.machu picchu change to +2 food
insert or replace into Building_YieldChanges (BuildingType, YieldType, YieldChange) values
('BUILDING_MACHU_PICCHU', 'YIELD_FOOD', 2);

--4a.Taj Mahal's: Golden age more tourism
UPDATE Buildings SET Description = 'LOC_BUILDING_TAJ_MAHAL_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_TAJ_MAHAL';

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_TAJ_MAHAL', 'TAJ_MAHAL_GOLDEN_AGE_TOURISM');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TAJ_MAHAL_GOLDEN_AGE_TOURISM', 'MODIFIER_PLAYER_ADJUST_TOURISM', 0, 0, 0, NULL, 'PLAYER_HAS_GOLDEN_AGE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TAJ_MAHAL_GOLDEN_AGE_TOURISM', 'Amount', '10');

--4b.GREAT_ZIMBABWE: Production Cost from 920 to 720
UPDATE Buildings SET Cost = 720 WHERE BuildingType = 'BUILDING_GREAT_ZIMBABWE';

--5.Statue of Liberty: New Cities gain +2 Citizen Population, Settler +3 movement
-- UPDATE ModifierArguments
-- SET Value=3
-- WHERE ModifierType = 'STATUELIBERTY_DIPLOVP' AND Name = 'Amount';

INSERT INTO Types (Type, Kind) VALUES	
('MODIFIER_PLAYER_BUILT_CITIES_ADD_POPULATION', 'KIND_MODIFIER');
INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES	
('MODIFIER_PLAYER_BUILT_CITIES_ADD_POPULATION', 'COLLECTION_PLAYER_BUILT_CITIES','EFFECT_ADJUST_CITY_POPULATION');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_STATUE_LIBERTY', 'SETTLER_CITY_EXTRA_POPULATION'),
('BUILDING_STATUE_LIBERTY', 'SETTLER_MOVEMENT_BUFF');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('SETTLER_CITY_EXTRA_POPULATION', 'MODIFIER_PLAYER_BUILT_CITIES_ADD_POPULATION', 0, 0, 0, NULL, NULL),
('SETTLER_MOVEMENT_BUFF', 'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT', 0, 0, 0, NULL, 'REQUIREMENT_UNIT_IS_SETTLER');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('SETTLER_CITY_EXTRA_POPULATION', 'Amount', '2'),
('SETTLER_MOVEMENT_BUFF', 'Amount', '3');

INSERT INTO Requirements (RequirementId, RequirementType) VALUES	
('UNIT_IS_SETTLER', 'REQUIREMENT_UNIT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES 	
('UNIT_IS_SETTLER',	'UnitType',	'UNIT_SETTLER');
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQUIREMENT_UNIT_IS_SETTLER', 'REQUIREMENTSET_TEST_ALL');	
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQUIREMENT_UNIT_IS_SETTLER', 'UNIT_IS_SETTLER');

--6.Chichen Itza: Rainforest no longer -1 appeal, rainforest +2 culture to all cities, cost from 710 to 920, no longer +1 production for the city
UPDATE Buildings SET Cost = 920 WHERE BuildingType = 'BUILDING_CHICHEN_ITZA';
DELETE FROM BuildingModifiers WHERE ModifierId = 'CHICHEN_ITZA_JUNGLE_PRODUCTION';
UPDATE Modifiers SET ModifierType = 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD' WHERE ModifierId = 'CHICHEN_ITZA_JUNGLE_CULTURE_MODIFIER';

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_CHICHEN_ITZA', 'CHICHEN_ITZA_ADJUST_APPEAL_RAINFOREST');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('CHICHEN_ITZA_ADJUST_APPEAL_RAINFOREST', 'MODIFIER_PLAYER_CITIES_ADJUST_FEATURE_APPEAL_MODIFIER', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('CHICHEN_ITZA_ADJUST_APPEAL_RAINFOREST', 'FeatureType', 'FEATURE_JUNGLE'),
('CHICHEN_ITZA_ADJUST_APPEAL_RAINFOREST', 'Amount', '1');


--7.Ruhr Valley: +1 Production for each Mine and Quarry in your civilization
UPDATE Modifiers
    SET ModifierType = 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD'
    WHERE ModifierId = 'RUHR_VALLEY_PRODUCTION_MODIFIER';

--8.orszaghaz, sydney_opera_house and estadio_do_maracana give diplomatic victory points
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_ORSZAGHAZ', 'ORSZAGHAZ_DIPLOVP'),
('BUILDING_SYDNEY_OPERA_HOUSE', 'SYDNEY_OPERA_HOUSE_DIPLOVP'),
('BUILDING_ESTADIO_DO_MARACANA', 'ESTADIO_DO_MARACANA_DIPLOVP'),
('BUILDING_BIOSPHERE', 'BIOSPHERE_DIPLOVP');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('ORSZAGHAZ_DIPLOVP', 'MODIFIER_PLAYER_ADJUST_DIPLOMATIC_VICTORY_POINTS', 1, 0, 1, NULL, NULL),
('SYDNEY_OPERA_HOUSE_DIPLOVP', 'MODIFIER_PLAYER_ADJUST_DIPLOMATIC_VICTORY_POINTS', 1, 0, 1, NULL, NULL),
('ESTADIO_DO_MARACANA_DIPLOVP', 'MODIFIER_PLAYER_ADJUST_DIPLOMATIC_VICTORY_POINTS', 1, 0, 1, NULL, NULL),
('BIOSPHERE_DIPLOVP', 'MODIFIER_PLAYER_ADJUST_DIPLOMATIC_VICTORY_POINTS', 1, 0, 1, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('ORSZAGHAZ_DIPLOVP', 'Amount', '2'),
('SYDNEY_OPERA_HOUSE_DIPLOVP', 'Amount', '3'),
('ESTADIO_DO_MARACANA_DIPLOVP', 'Amount', '2'),
('BIOSPHERE_DIPLOVP', 'Amount', '3');

--9.stonehenge, +1 faith to all quarry
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_STONEHENGE', 'STONEHENGE_QUARRY_FAITH');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('STONEHENGE_QUARRY_FAITH', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, 0, NULL, 'REQUIREMENTS_PLOT_HAS_QUARRY');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('STONEHENGE_QUARRY_FAITH', 'YieldType', 'YIELD_FAITH'),
('STONEHENGE_QUARRY_FAITH', 'Amount', '1');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQUIREMENTS_PLOT_HAS_QUARRY', 'REQUIREMENTSET_TEST_ALL');	
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQUIREMENTS_PLOT_HAS_QUARRY', 'REQUIRES_PLOT_HAS_QUARRY');

--Great library more slots
UPDATE Building_GreatWorks SET NumSlots = 3 WHERE BuildingType = 'BUILDING_GREAT_LIBRARY';

--Great lighthouse: nolonger needs light house building
DELETE FROM BuildingPrereqs WHERE Building = 'BUILDING_GREAT_LIGHTHOUSE' AND PrereqBuilding = 'BUILDING_LIGHTHOUSE';
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_GREAT_LIGHTHOUSE', 'GREAT_LIGHTHOUSE_GRANT_LIGHTHOUSE');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('GREAT_LIGHTHOUSE_GRANT_LIGHTHOUSE', 'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('GREAT_LIGHTHOUSE_GRANT_LIGHTHOUSE', 'BuildingType', 'BUILDING_LIGHTHOUSE');

--Univertiy of Sankore rework
UPDATE Buildings SET Description = 'LOC_BUILDING_UNIVERSITY_SANKORE_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_UNIVERSITY_SANKORE';

DELETE FROM BuildingModifiers WHERE BuildingType = 'BUILDING_UNIVERSITY_SANKORE';
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_UNIVERSITY_SANKORE', 'UNIVERSITY_SANKORE_TRAD_ROUTE_GOLD'),
('BUILDING_UNIVERSITY_SANKORE', 'UNIVERSITY_SANKORE_TRAD_ROUTE_SCIENCE'),
('BUILDING_UNIVERSITY_SANKORE', 'UNIVERSITY_SANKORE_TRAD_ROUTE_FAITH');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('UNIVERSITY_SANKORE_TRAD_ROUTE_GOLD', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD', 0, 0, 0, NULL, NULL),
('UNIVERSITY_SANKORE_TRAD_ROUTE_SCIENCE', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD', 0, 0, 0, NULL, NULL),
('UNIVERSITY_SANKORE_TRAD_ROUTE_FAITH', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('UNIVERSITY_SANKORE_TRAD_ROUTE_GOLD', 'Amount', '2'),
('UNIVERSITY_SANKORE_TRAD_ROUTE_GOLD', 'YieldType', 'YIELD_GOLD'),
('UNIVERSITY_SANKORE_TRAD_ROUTE_SCIENCE', 'Amount', '1'),
('UNIVERSITY_SANKORE_TRAD_ROUTE_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('UNIVERSITY_SANKORE_TRAD_ROUTE_FAITH', 'Amount', '1'),
('UNIVERSITY_SANKORE_TRAD_ROUTE_FAITH', 'YieldType', 'YIELD_FAITH');