-- Language: en_US
INSERT OR REPLACE INTO EnglishText (Tag,Text) VALUES
('LOC_IMPROVEMENT_ZIGGURAT_DESCRIPTION_ZJ', --Sumeria
'Unlocks the Builder ability to construct a Ziggurat, unique to Sumeria.[NEWLINE][NEWLINE]+2 [ICON_Science] Science +1 [ICON_Culture] Culture. Additional 1 [ICON_Culture] Culture if next to River. Cannot be built on Hills but may be built on Floodplains. Additional 1 [ICON_Culture] Culture and +1 [ICON_Science] Science once Education is discovered.'),
('LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION_ZJ',
'Sumerian unique Ancient era unit. Stronger than all other starting units. No penalties against anti-cavalry units. 4 [ICON_MOVEMENT] Movement if this unit starts in open terrain. +7 [ICON_Strength] Combat Strength when fighting Barbarians.'),

('LOC_BUILDING_TLACHTLI_DESCRIPTION_ZJ', --Aztec
'A building unique to the Aztecs. Provides 2 [ICON_Amenities] Amenities, +2 [ICON_Culture] Culture, +2 [ICON_Faith] Faith (duplicate yield each era since constructed or last repaired.), and a [ICON_GREATGENERAL] Great General Point. Provides +1 [ICON_Tourism] Tourism after advancing to the Conservation Civic.'),

('LOC_IMPROVEMENT_PYRAMID_DESCRIPTION_ZJ', --Nubia
'Improvement that unlocks with Masonry and must be built on Desert, Desert Hills or Desert Floodplains. +1 [ICON_Faith] Faith. Receives additional yields from adjacent districts. +1 [ICON_Food] Food if adjacent to a city center. Increase of +1 to the adjacency bonuses being earned by any adjacent district.'),
('LOC_DISTRICT_PYRAMID_FAITH_ZJ',
'+1 [ICON_Faith] Faith from the adjacent Nubian Pyramid.'),
('LOC_DISTRICT_PYRAMID_SCIENCE_ZJ',
'+1 [ICON_Science] Science from the adjacent Nubian Pyramid.'),
('LOC_DISTRICT_PYRAMID_GOLD_ZJ',
'+1 [ICON_Gold] Gold from the adjacent Nubian Pyramid.'),
('LOC_DISTRICT_PYRAMID_PRODUCTION_ZJ',
'+1 [ICON_Production] Production from the adjacent Nubian Pyramid.'),
('LOC_DISTRICT_PYRAMID_CULTURE_ZJ',
'+1 [ICON_Culture] Culture from the adjacent Nubian Pyramid.'),

('LOC_TRAIT_CIVILIZATION_NOBEL_PRIZE_DESCRIPTION_ZJ', --Sweden
'Sweden gains 50 [ICON_FAVOR] Diplomatic Favor when earning a Great Person (on Standard Speed). Sweden receives +2 [ICON_GREATENGINEER] Great Engineer point from Factories, +2 [ICON_GREATARTIST] Great Artist point from Factories, and +2 [ICON_GREATSCIENTIST] Great Scientist point from Universities. Having Sweden in the game adds three unique World Congress competitions starting in the Industrial Era.'),

('LOC_TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES_DESCRIPTION_ZJ', --Phoenicia
'Meet two other civilization will unlock Writing Technologies. Receive 1 [ICON_ENVOY] Envoy every times you founded a coastal city (Exclude Capital City). Coastal cities founded by Phoenicia and located on the same continent as the Phoenician [ICON_CAPITAL] Capital are 100% Loyal. Settlers gain +2 [ICON_MOVEMENT] Movement and +2 sight range while embarked. Settlers ignore additional [ICON_MOVEMENT] Movement costs from embarking and disembarking.'),

('LOC_TRAIT_CIVILIZATION_MALI_GOLD_DESERT_DESCRIPTION_ZJ', --Mali
'City Centers gain +1 [ICON_Faith] Faith and +1 [ICON_Food] Food for every adjacent Desert and Desert Hills tiles. Mines receive -1 [ICON_Production] Production and +4 [ICON_Gold] Gold. May purchase Commercial Hub and Goverment Plaza district buildings with [ICON_Faith] Faith. -30% [ICON_Production] Production toward constructing buildings or training units.'),
('LOC_DISTRICT_SUGUBA_DESCRIPTION_ZJ',
'A district unique to Mali specializing in finance and trade that replaces the Commercial Hub. Tiles, Units, Buildings, and Districts are 20% cheaper to purchase with [ICON_Gold] Gold and [ICON_Faith] Faith in this City.[NEWLINE][NEWLINE]+2 [ICON_Gold] Gold bonus for each adjacent Holy Site. +2 [ICON_Gold] Gold bonus from a tile containing a River edge. +1 [ICON_Gold] Gold bonus for every two adjacent district tiles.'),

('LOC_TRAIT_CIVILIZATION_FACES_OF_PEACE_DESCRIPTION_ZJ', --Canada
'Cannot declare war on City-States or surprise wars. Surprise wars cannot be declared on Canada. For every 100 [ICON_Tourism] Tourism per turn earn 1 [ICON_FAVOR] Diplomatic Favor per turn. Receive +100% [ICON_FAVOR] Diplomatic Favor from successfully completing an Emergency or Scored Competition. National Park +100% [ICON_Tourism] Tourism. Your cities earn +15% [ICON_Culture] Culture whenever you are not at war with any civilization.'),

('LOC_TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION_DESCRIPTION_ZJ', --England
'Iron, Coal and Aluminum Mines accumulate 2 more resources per turn. +100% [ICON_Production] Production towards Military Engineers. Military Engineers receive +2 charges. Buildings that provide additional yields when [ICON_POWER] Powered receive +5 of that yield. +20% [ICON_Production] Production towards Industrial Zone buildings. Harbor buildings increase Strategic Resource Stockpiles by +10 (on Standard Speed). Reveals [ICON_RESOURCE_COAL] Coal by Apprenticeship.'),

('LOC_TRAIT_CIVILIZATION_GROTE_RIVIEREN_DESCRIPTION_ZJ', --Neitherlands
"Major adjacency bonus for Campuses, Theater Squares, and Industrial Zones if next to a river. Culture Bomb adjacent tiles when completing a Harbor. +50% [ICON_Production] Production toward the Dam district and Flood Barrier building. Dams are unlocked with the Masonry technology. Grant boost [ICON_CIVICBOOSTED] to 'Exploration' each time a Harbor building is built (complete 'Exploration' if already boosted)."),

('LOC_TRAIT_CIVILIZATION_GREAT_TURKISH_BOMBARD_DESCRIPTION_ZJ', --Ottoman
'+50% [ICON_Production] Production toward siege units. All siege units gain +5 [ICON_STRENGTH] Combat Strength against district defenses. Conquered cities do not lose [ICON_CITIZEN] Population. Cities not founded by the Ottomans gain +1 [ICON_AMENITIES] Amenity and +4 Loyalty per turn. Exclusive unique Governor with military and diplomatic abilities.'),
('LOC_TRAIT_LEADER_SULEIMAN_GOVERNOR_DESCRIPTION_ZJ',
'Gain the Janissary unique unit and a [ICON_GOVERNOR] Governor Title when the Gunpowder technology is researched.'),

('LOC_TRAIT_CIVILIZATION_LAST_PROPHET_DESCRIPTION_ZJ', --Arabia
"Automatically receive the final [ICON_GreatProphet] Great Prophet when the next-to-last one is claimed (if you have not earned a [ICON_GreatProphet] Great Prophet already). +1 [ICON_Science] Science for each foreign city following Arabia's Religion. Campuses and Holy Sites receive a standard adjacency bonus from each other."),
('LOC_HOLY_SITE_SCIENCE',
'+{1_num} [ICON_SCIENCE] Science from an adjacent Holy Site district.'),
('LOC_CAMPUS_FAITH',
'+{1_num} [ICON_FAITH] Faith from an adjacent Campus district.'),

('LOC_TRAIT_CIVILIZATION_ALL_ROADS_TO_ROME_DESCRIPTION_ZJ', --ROME
'All cities you found or conquer start with a Trading Post. If in [ICON_TRADEROUTE] Trade Route range of your [ICON_CAPITAL] Capital, they also start with a road to it. Your [ICON_TRADEROUTE] Trade Routes earn +1 [ICON_Gold] Gold for passing through Trading Posts in your own cities. +4 [ICON_Strength] Unit Combat Strength when fighting Barbarians.'),

('LOC_TRAIT_CIVILIZATION_BABYLON_DESCRIPTION_ZJ',
'[ICON_TECHBOOSTED] Eurekas provide all of the [ICON_SCIENCE] Science for technologies. -50% [ICON_SCIENCE] Science per turn. [ICON_GREATSCIENTIST] Great Scientist cannot be earned.'),

('LOC_DISTRICT_HANSA_GOLD_ZJ', --Germany
'+{1_num} [ICON_Gold] Gold from the adjacent Hansa {1_Num : plural 1?tile; other?district;}.'),

('LOC_DISTRICT_HIPPODROME_FAITH_ZJ',
'+{1_num} [ICON_Faith] Faith from the adjacent Hippodrome {1_Num : plural 1?tile; other?district;}.'),

('LOC_CIVILIZATION_EXTRA_LIGHT_CAVALRY_DESCRIPTION_ZJ', --Scythia
'Receive a second light cavalry unit or Saka Horse Archer each time you train a light cavalry unit or Saka Horse Archer. Reveals [ICON_RESOURCE_HORSES] Horse from beginning.'),

('LOC_CIVILIZATION_FOUNDING_FATHERS_DESCRIPTION_ZJ',
'All Diplomatic policy slots in the current government are converted to Wildcard slots. +1 [ICON_FAVOR] Diplomatic Favor per turn for every Wildcard slot in their government. Reduces the cost of purchasing a tile by 25%.'),

('LOC_CIVILIZATION_PEARL_DANUBE_DESCRIPTION_ZJ', --Hungary
'+50% [ICON_Production] Production to Districts and Buildings constructed across a river from a City Center. The city build on Geothermal Fissure +2 [ICON_Food] Food , +2 [ICON_Production] Production, +1 [ICON_Housing] Housing. Constructs the first Sukiennice grant a free trader.'),

('LOC_BUILDING_STAVE_CHURCH_DESCRIPTION_ZJ', --Norway
'A building unique to Norway. Required to purchase Apostles and Inquisitors with [ICON_Faith] Faith. Holy Site districts get an additional standard adjacency bonus from Woods. +1 [ICON_Production] Production to each coastal resource tile in this city.');