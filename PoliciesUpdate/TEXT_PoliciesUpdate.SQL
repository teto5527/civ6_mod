INSERT OR REPLACE INTO EnglishText (Tag, Text) VALUES --Policeis
('LOC_POLICY_MILITARY_RECLAMATION_NAME',
'Military Reclamation'),

('LOC_POLICY_MILITARY_RECLAMATION_DESCRIPTION',
'Buildings in Encampment +2 [ICON_Food] Food and +2 [ICON_Production] Production.'),

('LOC_POLICY_PRIMITIVE_COMMUNE_NAME',
'Primitive Commune'),

('LOC_POLICY_PRIMITIVE_COMMUNE_DESCRIPTION', 
'+1 [ICON_Food] Food in all cities.'),

('LOC_POLICY_LIBERALISM_DESCRIPTION_ZJ', 
'+1 [ICON_Food] Food and +1 [ICON_Production] Production in all cities. +1 [ICON_AMENITIES] Amenity to all cities with at least 2 specialty districts.'),

('LOC_POLICY_GIFT_EXCHANGE_NAME',
'Gift Exchange'),

('LOC_POLICY_GIFT_EXCHANGE_DESCRIPTION',
'Receive 20 [ICON_Gold] Gold when you sent a delegation to another player.'),

-- ('LOC_POLICY_URBAN_RENEWAL_NAME',
-- 'Urban Renewal'),

-- ('LOC_POLICY_URBAN_RENEWAL_DESCRIPTION', 
-- '+50% [ICON_Production] Production toward City center buildings.'),

('LOC_POLICY_VETERANCY_DESCRIPTION_ZJ',
'+30% [ICON_Production] Production toward Aerodrome districts, Encampment districts, Harbor districts, and buildings for these districts.'),

('LOC_POLICY_FREE_MARKET_DESCRIPTION_ZJ',
'Extra [ICON_Gold] Gold or [ICON_Production] Production from buildings in Commercial Hubs and Harbors: +50% if city [ICON_Citizen] population is 10 or higher, +50% if district has at least +4 adjacency bonus.'),

('LOC_POLICY_RATIONALISM_DESCRIPTION_ZJ',
'Extra [ICON_Science] Science from buildings in Campuses: +50% if city [ICON_Citizen] population is 10 or higher, +50% if district has at least +4 adjacency bonus.'),

('LOC_POLICY_SIMULTANEUM_DESCRIPTION_ZJ',
'Extra [ICON_Faith] Faith from buildings in Holy Sites: +50% if city [ICON_Citizen] population is 10 or higher, +50% if district has at least +4 adjacency bonus.'),

('LOC_POLICY_GRAND_OPERA_DESCRIPTION_ZJ',
'Extra [ICON_Culture] Culture from buildings in Theaters: +50% if city [ICON_Citizen] population is 10 or higher, +50% if district has at least +4 adjacency bonus.'),

('LOC_POLICY_INTEGRATED_SPACE_CELL_DESCRIPTION_ZJ',
'+15% [ICON_Production] Production toward Space Race projects if a city has a Military Academy or a Hangar, or a Seaport.');

INSERT OR REPLACE INTO LocalizedText (Language, Tag, Text) VALUES
("zh_Hans_CN",  'LOC_POLICY_MILITARY_RECLAMATION_NAME',
'屯垦戍边'),
("zh_Hans_CN",  'LOC_POLICY_MILITARY_RECLAMATION_DESCRIPTION',
'军营内建筑物+2 [ICON_Food] 食物和 +2 [ICON_Production] 生产力。'),
("zh_Hans_CN",  'LOC_POLICY_PRIMITIVE_COMMUNE_NAME',
'原始公社'),
("zh_Hans_CN",  'LOC_POLICY_PRIMITIVE_COMMUNE_DESCRIPTION',
'所有城市+1 [ICON_Food] 食物。'),
("zh_Hans_CN",  'LOC_POLICY_LIBERALISM_DESCRIPTION_ZJ',
'所有城市+1 [ICON_Food] 食物和+1 [ICON_Production] 生产力。拥有至少两个独立区域的所有城市+1 [ICON_AMENITIES] 宜居度。'),
("zh_Hans_CN",  'LOC_POLICY_GIFT_EXCHANGE_NAME',
'礼尚往来'),
("zh_Hans_CN",  'LOC_POLICY_GIFT_EXCHANGE_DESCRIPTION',
'向其他玩家派遣代表团时获得20 [ICON_Gold] 金币。'),
-- ("zh_Hans_CN",  'LOC_POLICY_URBAN_RENEWAL_NAME',
-- '翻新改造'),
-- ("zh_Hans_CN",  'LOC_POLICY_URBAN_RENEWAL_DESCRIPTION',
-- '建造市中心建筑时+50% [ICON_Production] 生产力。'),
("zh_Hans_CN",  'LOC_POLICY_VETERANCY_DESCRIPTION_ZJ',
'建造军营、港口、航空港和这些区域中的建筑时+30% [ICON_Production] 生产力。');