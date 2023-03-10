-- GameData1
-- Author: zjhao
-- DateCreated: 4/29/2022 5:53:50 PM
--------------------------------------------------------------
--0.tamp test
-- UPDATE Units
--     SET BaseMoves=4
--     WHERE UnitType='UNIT_SETTLER';

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

--4a.Taj Mahal's: Production Cost from 920 to 720
UPDATE Buildings
SET Cost = Cost-200
WHERE BuildingType = 'BUILDING_TAJ_MAHAL';

--4b.GREAT_ZIMBABWE: Production Cost from 920 to 720
UPDATE Buildings
SET Cost = Cost-200
WHERE BuildingType = 'BUILDING_GREAT_ZIMBABWE';

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

--6.Chichen Itza: Rainforest no longer -1 appeal
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
UPDATE Buildings SET Description = 'LOC_BUILDING_STONEHENGE_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_STONEHENGE';

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

--Kotoku-in, Grants 0 Warrior Monks, worship buildings provide  Culture equal to their intrinsic  Faith output.
-- UPDATE buildings SET Description = 'LOC_BUILDING_KOTOKU_IN_DESCRIPTION_ZJ' WHERE BuildingType = 'BUILDING_KOTOKU_IN';

-- INSERT OR REPLACE INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
-- ('BUILDING_KOTOKU_IN', 'KOTOKU_WORSHIP_BUILDINGS_CULTURE');
-- INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
-- ('KOTOKU_WORSHIP_BUILDINGS_CULTURE', 'MODIFIER_BUILDING_YIELD_CHANGE', 0, 0, 0, NULL, NULL);
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
-- ('KOTOKU_GRANTMONKS', 'Amount', '0'),
-- ('KOTOKU_WORSHIP_BUILDINGS_CULTURE', 'BuildingType', 'BUILDING_CATHEDRAL'),
-- ('KOTOKU_WORSHIP_BUILDINGS_CULTURE', 'YieldType', 'YIELD_CULTURE'),
-- ('KOTOKU_WORSHIP_BUILDINGS_CULTURE', 'Amount', '3');