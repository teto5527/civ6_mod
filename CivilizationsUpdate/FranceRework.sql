--France
--TEXT
UPDATE Traits SET Description = 'LOC_TRAIT_CIVILIZATION_WONDER_TOURISM_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_CIVILIZATION_WONDER_TOURISM';
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_FLYING_SQUADRON_DESCRIPTION_ZJ' WHERE TraitType = 'FLYING_SQUADRON_TRAIT';
UPDATE Traits SET Description = 'LOC_TRAIT_LEADER_MAGNIFICENCES_DESCRIPTION_ZJ' WHERE TraitType = 'TRAIT_LEADER_MAGNIFICENCES';

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES --Build theater and its buildings quicker
('TRAIT_CIVILIZATION_WONDER_TOURISM', 'TRAIT_THEATER_ADJUST_PRODUCTION'),
('TRAIT_CIVILIZATION_WONDER_TOURISM', 'TRAIT_THEATER_BUIDINGS_ADJUST_PRODUCTION');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES 
('TRAIT_THEATER_ADJUST_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION', 0, 0, 0, NULL, NULL),
('TRAIT_THEATER_BUIDINGS_ADJUST_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 0, 0, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_THEATER_ADJUST_PRODUCTION', 'DistrictType', 'DISTRICT_THEATER'),
('TRAIT_THEATER_ADJUST_PRODUCTION', 'Amount', '50'),
('TRAIT_THEATER_BUIDINGS_ADJUST_PRODUCTION', 'DistrictType', 'DISTRICT_THEATER'),
('TRAIT_THEATER_BUIDINGS_ADJUST_PRODUCTION', 'Amount', '50');

--Black queen: SPY AND TRADER +2 sight (HD)
insert or replace into Types (Type,	Kind) values
('ABILITY_SPY_AND_TRADER_BONUS_SIGHT', 'KIND_ABILITY');
insert or replace into TypeTags (Type, Tag) values
('ABILITY_SPY_AND_TRADER_BONUS_SIGHT', 'CLASS_SPY'),
('ABILITY_SPY_AND_TRADER_BONUS_SIGHT', 'CLASS_TRADER');
insert or replace into UnitAbilities (UnitAbilityType, Name, Description, Inactive) values
('ABILITY_SPY_AND_TRADER_BONUS_SIGHT', NULL, NULL, 1);
insert or replace into UnitAbilityModifiers (UnitAbilityType, ModifierId) values
('ABILITY_SPY_AND_TRADER_BONUS_SIGHT', 'CATHERINE_BONUS_SIGHT');
insert or replace into Modifiers(ModifierId, ModifierType, Permanent)values
('CATHERINE_BONUS_SIGHT', 'MODIFIER_PLAYER_UNIT_ADJUST_SIGHT', 1);
insert or replace into ModifierArguments (ModifierId, Name,	Value) values
('CATHERINE_BONUS_SIGHT', 'Amount',	2);

insert or replace into TraitModifiers (TraitType, ModifierId) values
('FLYING_SQUADRON_TRAIT', 'SPY_AND_TRADER_BONUS_SIGHT');
insert or replace into Modifiers (ModifierId, ModifierType, Permanent) values
('SPY_AND_TRADER_BONUS_SIGHT', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 1);
insert or replace into ModifierArguments (ModifierId, Name,	Value) values
('SPY_AND_TRADER_BONUS_SIGHT', 'AbilityType', 'ABILITY_SPY_AND_TRADER_BONUS_SIGHT');