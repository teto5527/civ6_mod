INSERT INTO Distriots(DistrictType, Name, PrereqTech, Description, Cost, RequiresPlacement, NoAdjacentCity, Aqueduct, InternalOnly, CaptureRemovesBuildings, CaptureRemovesCityDefenses, 
PlunderType, PlunderAmount, MilitaryDomain, CostProgressionModel, CostProgressionParam1, OnePerCity, Maintenance, TravelTime, CityStrengthModifier, AdvisorType) VALUES
('DISTRICT_CAMPUS_CITY', 'LOC_DISTRICT_CAMPUS_CITY_NAME', 'TECH_WRITING', 'LOC_DISTRICT_CAMPUS_CITY_DESCRIPTION_ZJ', 81, 1, 0, 0, 0, 0, 0,
'PLUNDER_SCIENCE', 25, 'NO_DOMAIN', 'COST_PROGRESSION_NUM_UNDER_AVG_PLUS_TECH', 40, 0, 2, -1, 2, 'ADVISOR_TECHNOLOGY');

INSERT INTO DistrictReplaces(CivUniqueDistrictType, ReplacesDistrictType) VALUES
('DISTRICT_CAMPUS_CITY', 'DISTRICT_CAMPUS');

INSERT INTO District_TradeRouteYields(DistrictType, YieldType, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES
('DISTRICT_CAMPUS_CITY', 'YIELD_FOOD', 0, 1, 0);
INSERT INTO District_TradeRouteYields(DistrictType, YieldType, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination) VALUES
('DISTRICT_CAMPUS_CITY', 'YIELD_SCIENCE', 0, 0, 1);

INSERT INTO District_GreatPersonPoints(DistrictType, GreatPersonClassType, PointsPerTurn) VALUES
('DISTRICT_CAMPUS_CITY', 'GREAT_PERSON_CLASS_SCIENTIST', 1);

INSERT INTO District_CitizenYieldChanges(DistrictType, YieldType, YieldChange) VALUES
('DISTRICT_CAMPUS_CITY', 'YIELD_SCIENCE', 3)

INSERT INTO District_Adjacencies(DistrictType, YieldChangeId) VALUES
('DISTRICT_HOLY_SITE', 'CampusCity_Faith');
INSERT INTO District_Adjacencies(DistrictType, YieldChangeId) VALUES
('DISTRICT_CAMPUS_CITY', 'CampusCity_Science');
INSERT INTO District_Adjacencies(DistrictType, YieldChangeId) VALUES
('DISTRICT_CAMPUS_CITY', 'NegativeCampusCity_Science');
INSERT INTO District_Adjacencies(DistrictType, YieldChangeId) VALUES
('DISTRICT_CAMPUS_CITY', 'Government_Science');

INSERT INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
('CampusCity_Faith', 'LOC_DISTRICT_CampusCity_Faith', 'YIELD_FAITH', 2, 1, 'DISTRICT_CAMPUS_CITY');
INSERT INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
('CampusCity_Science', 'LOC_DISTRICT_CampusCity_Seience', 'YIELD_SCIENCE', 2, 1, 'DISTRICT_CAMPUS_CITY');

--fu shou yi qu yu
INSERT INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
('NegativeCampusCity_Science', 'LOC_DISTRICT_NegativeCampusCity_Seience', 'YIELD_SCIENCE', -2, 1, 'DISTRICT_ENCAMPMENT');
INSERT INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
('NegativeCampusCity_Science', 'LOC_DISTRICT_NegativeCampusCity_Seience', 'YIELD_SCIENCE', -2, 1, 'DISTRICT_HARBOR');
INSERT INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
('NegativeCampusCity_Science', 'LOC_DISTRICT_NegativeCampusCity_Seience', 'YIELD_SCIENCE', -2, 1, 'DISTRICT_COMMERCIAL_HUB');
INSERT INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
('NegativeCampusCity_Science', 'LOC_DISTRICT_NegativeCampusCity_Seience', 'YIELD_SCIENCE', -2, 1, 'DISTRICT_INDUSTRIAL_ZONE');
INSERT INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
('NegativeCampusCity_Science', 'LOC_DISTRICT_NegativeCampusCity_Seience', 'YIELD_SCIENCE', -2, 1, 'DISTRICT_THEATER');
INSERT INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
('NegativeCampusCity_Science', 'LOC_DISTRICT_NegativeCampusCity_Seience', 'YIELD_SCIENCE', -2, 1, 'DISTRICT_ENCAMPMENT');
INSERT INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
('NegativeCampusCity_Science', 'LOC_DISTRICT_NegativeCampusCity_Seience', 'YIELD_SCIENCE', -2, 1, 'DISTRICT_ENCAMPMENT_COMPLEX');
INSERT INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES
('NegativeCampusCity_Science', 'LOC_DISTRICT_NegativeCampusCity_Seience', 'YIELD_SCIENCE', -2, 1, 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX');