-- Language: en_US
INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES --Govs
('LOC_GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR_DESCRIPTION_ZJ',
'+3 [ICON_Gold] Gold per turn for each [ICON_Citizen] Citizen in the city.'),

('LOC_GOVERNOR_PROMOTION_CARDINAL_BISHOP_DESCRIPTION_ZJ',
'Religious pressure to adjacent cities is 100% stronger from this city. +2 [ICON_Faith] Faith for every specialty district in this city. Gain [ICON_Faith] Faith equal to 15% of the construction cost when finishing buildings.'),

('LOC_GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD_DESCRIPTION_ZJ',
"City ignores religious pressure from Religions not founded by the [ICON_Governor] Governor's player. [ICON_TRADEROUTE] Trade Routes ending here provide +2 [ICON_Faith] Faith to the starting city."),

('LOC_GOVERNOR_GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS_DESCRIPTION_ZJ',
"+10 [ICON_Religion] Religious Strength in theological combat in tiles of this city. All [ICON_Governor] Governor's units heal fully in one turn in tiles of this city."),

('LOC_GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR_DESCRIPTION_ZJ',
'Double adjacency bonuses from Holy Site within 4 tiles of this city.'),

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
'Allows Traders to embark, and allows harvesting of [ICON_RESOURCE_Fish] Fish and [ICON_RESOURCE_Crabs] Crabs. Fishing Boats improvements receive +1 [ICON_GOLD] Gold.'),

('LOC_TECH_CHEMISTRY_DESCRIPTION_ZJ',
"Industrial Zone district's [ICON_Production] Production adjacency bonus provides [ICON_Food] Food as well.");

INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES -- District and Buildings
('LOC_DISTRICT_CULTURE_CITY_CENTER_MAJOR_ZJ',
'+{1_num} [ICON_Culture] Culture from the adjacent City Center.'),

('LOC_DISTRICT_ACROPOLIS_EXPANSION2_DESCRIPTION',
'+1 [ICON_Culture] Culture bonus for each adjacent district and an additional +2 [ICON_Culture] Culture bonus for adjacent City Center. +2 [ICON_Culture] Culture bonus for each adjacent wonder, Entertainment Complex, and Water Park. Can only be built on Hills.'),

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
'Bonus resources improved by Farms gain +1 [ICON_FOOD] Food each. Resources improved by Pastures gain +1 [ICON_Production] Production each.'),

('LOC_BUILDING_CONSULATE_DESCRIPTION_ZJ',
"+2 Influence Points per turn. +0.25 Alliance Points per turn. Enemy Spy's level is reduced by 1 when targeting this city or cities with Encampments."),

('LOC_BUILDING_CHANCERY_DESCRIPTION_ZJ',
'+3 Influence Points per turn. +0.25 Alliance Points per turn. When this civilization captures or kills an enemy Spy, receive 50 [ICON_Science] Science for every level of the enemy Spy.');

INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES --Civics
('LOC_CIVIC_GUILDS_DESCRIPTION_ZJ',
'Lumber Mills can be built on Rainforest.'),

('LOC_CIVIC_MERCANTILISM_DESCRIPTION_ZJ',
'Camp improvements receive +1 [ICON_Production] Production and +1 [ICON_Food] Food.'),

('LOC_GOVT_INHERENT_BONUS_COMMUNISM_XP1_ZJ',
'+0.6 [ICON_Production] Production per [ICON_Citizen] Citizen.'),

('LOC_DISTRICT_CANAL_GOLD_ZJ',
'+2 [ICON_Gold] Gold from the adjacent Canal.');

INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES --units
('LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION_ZJ',
'Requires a Barracks or Stable to produce. Can construct Roads, Railroads, Forts, Airstrips, Missile Silos, and Mountain Tunnel improvements. One of their build charges can also be used to complete 50% of a Canal, Dam or Aqueduct district or a Flood Barrier building.');

INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES --Dedications
('LOC_MOMENT_CATEGORY_INFRASTRUCTURE_BONUS_GOLDEN_AGE_ZJ',
'+2 [ICON_MOVEMENT] Movement for all Builders. May purchase civilian units with [ICON_Faith] Faith. Builders and Settlers are 15% cheaper to purchase with [ICON_Faith] Faith and [ICON_Gold] Gold.'),
('LOC_MOMENT_CATEGORY_CULTURAL_BONUS_GOLDEN_AGE_ZJ',
'[ICON_CIVICBOOSTED] Inspirations provide an additional 10% of civic costs. Each city receives +2 [ICON_Culture] Culture for each specialty district.');