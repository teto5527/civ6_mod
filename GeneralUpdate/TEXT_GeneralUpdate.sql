-- Language: en_US
INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES --Govs
('LOC_GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR_DESCRIPTION_ZJ',
'+4 [ICON_Gold] Gold per turn for each [ICON_Citizen] Citizen in the city.'),

('LOC_GOVERNOR_PROMOTION_CARDINAL_BISHOP_DESCRIPTION_ZJ',
'Religious pressure to adjacent cities is 100% stronger from this city. +3 [ICON_Faith] Faith for every specialty district in this city.'),

('LOC_GOVERNOR_GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS_DESCRIPTION_ZJ',
"+10 [ICON_Religion] Religious Strength in theological combat in tiles of this city. All [ICON_Governor] Governor's units heal fully in one turn in tiles of this city."),

('LOC_GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR_DESCRIPTION_ZJ',
'Double adjacency bonuses from Holy Site in the city.'),

('LOC_GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE_DESCRIPTION_ZJ',
"This city's improvements, buildings, and districts cannot be damaged by Environmental Effects. +1 [ICON_Production] Production (become +2 [ICON_Production] Production after researching Industrialization) per turn for each [ICON_Citizen] Citizen in the city."),

('LOC_GOVERNOR_PROMOTION_ZONING_COMMISSIONER_DESCRIPTION_ZJ',
'+20% [ICON_Production] Production towards constructing districts and buildings in the city.'),

('LOC_GOVERNOR_PROMOTION_CAPOU_AGHA_DESCRIPTION_ZJ',
'When established in a foreign [ICON_Capital] Capital, [ICON_STAT_GRIEVANCE] Grievances from the city owner against you are reduced by 5 more per turn.'),

('LOC_GOVERNOR_PROMOTION_KHASS_ODA_BASHI_DESCRIPTION_ZJ',
'When established in an allied foreign [ICON_Capital] Capital, your Alliance Points with the owner increase an extra 1 per turn.');

INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES --Technologies
('LOC_TECH_SAILING_DESCRIPTION_ZJ',
'Allows Builders and Scouts to embark.'),
('LOC_TECH_IRRIGATION_DESCRIPTION_ZJ',
'Allows clearing and farming of Marsh, and harvesting of [ICON_RESOURCE_Bananas] Bananas.'),

('LOC_TECH_MASS_PRODUCTION_DESCRIPTION_ZJ',
'Lumber Mill improvements receive +1 [ICON_Production] Production.'),

('LOC_TECH_ENGINEERING_DESCRIPTION_ZJ',
'Quarry improvements receive +1 [ICON_Production] Production.'),

('LOC_TECH_MINING_DESCRIPTION_ZJ',
'Allows chopping of Woods, and harvesting of [ICON_RESOURCE_Copper] Copper.'),

('LOC_CIVIC_COLONIALISM_DESCRIPTION_ZJ',
'The Fishing Boats improvement receives +2 [ICON_Production] Production.'),

('LOC_TECH_CELESTIAL_NAVIGATION_DESCRIPTION_ZJ',
'Allows Traders to embark, and allows harvesting of [ICON_RESOURCE_Fish] Fish and [ICON_RESOURCE_Crabs] Crabs. Fishing Boats improvements receive +1 [ICON_GOLD] Gold.');

INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES --buildings
('LOC_DISTRICT_CULTURE_CITY_CENTER_MAJOR_ZJ',
'+{1_num} [ICON_Culture] Culture from the adjacent City Center.'),

('LOC_DISTRICT_AERODROME_NAME_ZJ',
'A district that allows you to build and store aircraft. Cannot be built on Hills.[NEWLINE]+100% [ICON_Tourism] Tourism from improvements, National Parks, and Wonders in this city.'),

('LOC_DISTRICT_AERODROME_PRODUCTION_ZJ',
'+{1_num} [ICON_Production] Production from the adjacent Aerodrome {1_Num : plural 1?tile; other?district;}.'),

('LOC_DISTRICT_AERODROME_GOLD_ZJ',
'+{1_num} [ICON_Gold] Gold from the adjacent Aerodrome {1_Num : plural 1?tile; other?district;}.'),

('LOC_BUILDING_GOV_TALL_DESCRIPTION_ZJ',
'All cities +80% yield, but every additional city will decrease this number by 20%. All cities +3 [ICON_HOUSING] Housing. [NEWLINE]Awards +1 [ICON_GOVERNOR] Governor Title.'),

('LOC_BUILDING_GROVE_DESCRIPTION_ZJ',
'Grants +1 [ICON_FOOD] Food and +1 [ICON_FAITH] Faith to adjacent unimproved Charming tiles. Increased to +2 [ICON_FOOD] Food, +2 [ICON_FAITH] Faith, +2 [ICON_Culture] Culture for adjacent unimproved Breathtaking tiles, and half yield to adjacent Water tiles.'),

('LOC_BUILDING_SANCTUARY_DESCRIPTION_ZJ',
'Grants +1 [ICON_Science] Science and +1 [ICON_Gold] Gold to adjacent unimproved Charming tiles. Increased to +2 [ICON_Science] Science, +2 [ICON_Gold] Gold, +2 [ICON_Production] Production for adjacent unimproved Breathtaking tiles, and half yield to adjacent Water tiles.'),

('LOC_BUILDING_WATER_MILL_DESCRIPTION_ZJ',
'Bonus resources improved by Farms gain +1 [ICON_FOOD] Food each. Resources improved by Pastures gain +1 [ICON_Production] Production each.');

INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES
('LOC_GOVT_INHERENT_BONUS_COMMUNISM_XP1_ZJ',
'+0.6 [ICON_Production] Production per [ICON_Citizen] Citizen.'),

('LOC_POLICY_COLLECTIVIZATION_DESCRIPTION_XP2_ZJ',
'+4 [ICON_Production] Production and +4 [ICON_Food] Food from domestic [ICON_TradeRoute] Trade Routes.'),

('LOC_DISTRICT_CANAL_GOLD_ZJ',
'+2 [ICON_Gold] Gold from the adjacent Canal.');

INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES --units
('LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION_ZJ',
'Can construct Roads, Railroads, Forts, Airstrips, Missile Silos, and Mountain Tunnel improvements. One of their build charges can also be used to complete 20% of a Canal, Dam or Aqueduct district or a Flood Barrier building.');