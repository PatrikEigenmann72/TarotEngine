-- ============================
-- INSTALL SCRIPT (DEVELOPMENT / FIRST RUN)
-- ============================

DROP TABLE IF EXISTS archetype;
DROP TABLE IF EXISTS card;
DROP TABLE IF EXISTS deck;
DROP TABLE IF EXISTS association;
DROP TABLE IF EXISTS association_type;
DROP TABLE IF EXISTS config;
DROP TABLE IF EXISTS settings;
DROP INDEX IF EXISTS idx_assoc_type;
DROP INDEX IF EXISTS idx_assoc_archetype;
DROP INDEX IF EXISTS idx_assoc_card;

-- ============================
-- 1. ARCHETYPE (STATIC)
-- ============================

CREATE TABLE archetype (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    number    VARCHAR(2) NOT NULL DEFAULT '00',
    name      TEXT NOT NULL UNIQUE,
    type      TEXT NOT NULL CHECK (type IN ('major','minor'))
);

-- ============================
-- INSERT: ALL 78 ARCHETYPES (RWS ORDER)
-- ============================

INSERT INTO archetype (number, name, type) VALUES
-- Major Arcana
('00', 'The Fool', 'major'),
('01', 'The Magician', 'major'),
('02', 'The High Priestess', 'major'),
('03', 'The Empress', 'major'),
('04', 'The Emperor', 'major'),
('05', 'The Hierophant', 'major'),
('06', 'The Lovers', 'major'),
('07', 'The Chariot', 'major'),
('08', 'Strength', 'major'),
('09', 'The Hermit', 'major'),
('10', 'Wheel of Fortune', 'major'),
('11', 'Justice', 'major'),
('12', 'The Hanged Man', 'major'),
('13', 'Death', 'major'),
('14', 'Temperance', 'major'),
('15', 'The Devil', 'major'),
('16', 'The Tower', 'major'),
('17', 'The Star', 'major'),
('18', 'The Moon', 'major'),
('19', 'The Sun', 'major'),
('20', 'Judgement', 'major'),
('21', 'The World', 'major'),

-- Wands
('22', 'Ace of Wands', 'minor'),
('23', 'Two of Wands', 'minor'),
('24', 'Three of Wands', 'minor'),
('25', 'Four of Wands', 'minor'),
('26', 'Five of Wands', 'minor'),
('27', 'Six of Wands', 'minor'),
('28', 'Seven of Wands', 'minor'),
('29', 'Eight of Wands', 'minor'),
('30', 'Nine of Wands', 'minor'),
('31', 'Ten of Wands', 'minor'),
('32', 'Page of Wands', 'minor'),
('33', 'Knight of Wands', 'minor'),
('34', 'Queen of Wands', 'minor'),
('35', 'King of Wands', 'minor'),

-- Cups
('36', 'Ace of Cups', 'minor'),
('37', 'Two of Cups', 'minor'),
('38', 'Three of Cups', 'minor'),
('39', 'Four of Cups', 'minor'),
('40', 'Five of Cups', 'minor'),
('41', 'Six of Cups', 'minor'),
('42', 'Seven of Cups', 'minor'),
('43', 'Eight of Cups', 'minor'),
('44', 'Nine of Cups', 'minor'),
('45', 'Ten of Cups', 'minor'),
('46', 'Page of Cups', 'minor'),
('47', 'Knight of Cups', 'minor'),
('48', 'Queen of Cups', 'minor'),
('49', 'King of Cups', 'minor'),

-- Swords
('50', 'Ace of Swords', 'minor'),
('51', 'Two of Swords', 'minor'),
('52', 'Three of Swords', 'minor'),
('53', 'Four of Swords', 'minor'),
('54', 'Five of Swords', 'minor'),
('55', 'Six of Swords', 'minor'),
('56', 'Seven of Swords', 'minor'),
('57', 'Eight of Swords', 'minor'),
('58', 'Nine of Swords', 'minor'),
('59', 'Ten of Swords', 'minor'),
('60', 'Page of Swords', 'minor'),
('61', 'Knight of Swords', 'minor'),
('62', 'Queen of Swords', 'minor'),
('63', 'King of Swords', 'minor'),

-- Pentacles
('64', 'Ace of Pentacles', 'minor'),
('65', 'Two of Pentacles', 'minor'),
('66', 'Three of Pentacles', 'minor'),
('67', 'Four of Pentacles', 'minor'),
('68', 'Five of Pentacles', 'minor'),
('69', 'Six of Pentacles', 'minor'),
('70', 'Seven of Pentacles', 'minor'),
('71', 'Eight of Pentacles', 'minor'),
('72', 'Nine of Pentacles', 'minor'),
('73', 'Ten of Pentacles', 'minor'),
('74', 'Page of Pentacles', 'minor'),
('75', 'Knight of Pentacles', 'minor'),
('76', 'Queen of Pentacles', 'minor'),
('77', 'King of Pentacles', 'minor');

INSERT INTO archetype (number, name, type)
VALUES ('79', 'The Multiverse', 'major');

INSERT INTO archetype (number, name, type)
VALUES ('80', 'The Empty Card', 'major');

-- ============================
-- 2. DECK (STATIC)
-- ============================

CREATE TABLE deck (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    name      TEXT NOT NULL UNIQUE,
    short     TEXT NOT NULL UNIQUE,
    creator   TEXT,
    year      INTEGER,
    notes     TEXT
);

INSERT INTO deck (name, short, creator, year, notes)
VALUES ('Tarot of the Vampyres', 'TOV', 'Ian Daniels', 2010, 'Perfect for Shadow work!');

INSERT INTO deck (name, short, creator, year, notes)
VALUES ('Thoth Tarot', 'Thoth', 'Aleister Crowley', 1969, 'Hermetic Magick, Ceremonial Magick');

INSERT INTO deck (name, short, creator, year, notes)
VALUES ('Gilded Tarot', 'Gilded', 'Ciro Marchetti', 2004, 'Modern RWS-style deck with vivid digital art.');

INSERT INTO deck (name, short, creator, year, notes)
VALUES ('The Black Tarot', 'Black', 'Victoria Iva', 2021, 'Dark, modern RWS-style deck with high-contrast symbolism.');

INSERT INTO deck (name, short, creator, year, notes)
VALUES ('The Quest Tarot', 'Quest', 'Joseph Ernest Martin', 2001, 'Symbol-rich multimedia deck blending RWS, Thoth, runes, and Qabalah.');

INSERT INTO deck (name, short, creator, year, notes)
VALUES ('Haindl Tarot', 'Haindl', 'Hermann Haindl', 1990, 'Global mythic deck with elemental, Norse, Hindu, and Native American correspondences.');

INSERT INTO deck (name, short, creator, year, notes)
VALUES ('The Runic Tarot', 'Runic', 'Jack Sephiroth', 2022, 'Norse mythology deck blending Elder Futhark runes with RWS structure.');

-- ============================
-- 3. CARD (STATIC)
-- ============================

CREATE TABLE card (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    deck_id       INTEGER NOT NULL,
    archetype_id  INTEGER NOT NULL,
    name          TEXT NOT NULL,
    image         TEXT,
    FOREIGN KEY(deck_id) REFERENCES deck(id),
    FOREIGN KEY(archetype_id) REFERENCES archetype(id)
);


-- Tarot of the Vampyres — Major Arcana
INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Fool', a.number || ' - The Fool.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='00';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Magician', a.number || ' - The Magician.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='01';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The High Priestess', a.number || ' - The High Priestess.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='02';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Empress', a.number || ' - The Empress.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='03';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Emperor', a.number || ' - The Emperor.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='04';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Hierophant', a.number || ' - The Hierophant.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='05';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Lovers', a.number || ' - The Lovers.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='06';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Chariot', a.number || ' - The Chariot.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='07';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Strength', a.number || ' - Strength.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='08';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Hermit', a.number || ' - The Hermit.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='09';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Wheel of Fortune', a.number || ' - Wheel of Fortune.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='10';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Justice', a.number || ' - Justice.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='11';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Hanged Man', a.number || ' - The Hanged Man.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='12';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Death', a.number || ' - Death.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='13';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Temperance', a.number || ' - Temperance.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='14';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Devil', a.number || ' - The Devil.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='15';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Tower', a.number || ' - The Tower.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='16';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Star', a.number || ' - The Star.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='17';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Moon', a.number || ' - The Moon.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='18';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The Sun', a.number || ' - The Sun.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='19';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Judgement', a.number || ' - Judgement.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='20';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'The World', a.number || ' - The World.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='21';

-- Tarot of the Vampyres — Scepters (Wands)
INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Ace of Scepters', a.number || ' - Ace of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='22';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Two of Scepters', a.number || ' - Two of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='23';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Three of Scepters', a.number || ' - Three of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='24';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Four of Scepters', a.number || ' - Four of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='25';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Five of Scepters', a.number || ' - Five of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='26';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Six of Scepters', a.number || ' - Six of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='27';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Seven of Scepters', a.number || ' - Seven of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='28';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Eight of Scepters', a.number || ' - Eight of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='29';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Nine of Scepters', a.number || ' - Nine of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='30';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Ten of Scepters', a.number || ' - Ten of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='31';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Daughter of Scepters', a.number || ' - Daughter of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='32';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Prince of Scepters', a.number || ' - Prince of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='33';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Queen of Scepters', a.number || ' - Queen of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='34';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Lord of Scepters', a.number || ' - Lord of Scepters.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='35';


-- Tarot of the Vampyres — Grails (Cups)
INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Ace of Grails', a.number || ' - Ace of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='36';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Two of Grails', a.number || ' - Two of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='37';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Three of Grails', a.number || ' - Three of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='38';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Four of Grails', a.number || ' - Four of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='39';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Five of Grails', a.number || ' - Five of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='40';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Six of Grails', a.number || ' - Six of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='41';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Seven of Grails', a.number || ' - Seven of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='42';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Eight of Grails', a.number || ' - Eight of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='43';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Nine of Grails', a.number || ' - Nine of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='44';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Ten of Grails', a.number || ' - Ten of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='45';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Daughter of Grails', a.number || ' - Daughter of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='46';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Prince of Grails', a.number || ' - Prince of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='47';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Queen of Grails', a.number || ' - Queen of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='48';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Lord of Grails', a.number || ' - Lord of Grails.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='49';

-- Tarot of the Vampyres — Knives (Swords)
INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Ace of Knives', a.number || ' - Ace of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='50';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Two of Knives', a.number || ' - Two of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='51';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Three of Knives', a.number || ' - Three of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='52';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Four of Knives', a.number || ' - Four of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='53';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Five of Knives', a.number || ' - Five of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='54';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Six of Knives', a.number || ' - Six of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='55';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Seven of Knives', a.number || ' - Seven of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='56';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Eight of Knives', a.number || ' - Eight of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='57';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Nine of Knives', a.number || ' - Nine of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='58';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Ten of Knives', a.number || ' - Ten of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='59';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Daughter of Knives', a.number || ' - Daughter of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='60';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Prince of Knives', a.number || ' - Prince of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='61';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Queen of Knives', a.number || ' - Queen of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='62';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Lord of Knives', a.number || ' - Lord of Knives.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='63';

-- Tarot of the Vampyres — Skulls (Pentacles)
INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Ace of Skulls', a.number || ' - Ace of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='64';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Two of Skulls', a.number || ' - Two of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='65';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Three of Skulls', a.number || ' - Three of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='66';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Four of Skulls', a.number || ' - Four of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='67';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Five of Skulls', a.number || ' - Five of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='68';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Six of Skulls', a.number || ' - Six of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='69';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Seven of Skulls', a.number || ' - Seven of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='70';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Eight of Skulls', a.number || ' - Eight of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='71';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Nine of Skulls', a.number || ' - Nine of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='72';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Ten of Skulls', a.number || ' - Ten of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='73';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Daughter of Skulls', a.number || ' - Daughter of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='74';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Prince of Skulls', a.number || ' - Prince of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='75';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Queen of Skulls', a.number || ' - Queen of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='76';

INSERT INTO card (deck_id, archetype_id, name, image)
SELECT d.id, a.id, 'Lord of Skulls', a.number || ' - Lord of Skulls.png'
FROM deck d, archetype a
WHERE d.short='TOV' AND a.number='77';

-- ============================
-- 4. ASSOCIATION TYPE (STATIC)
-- ============================

CREATE TABLE association_type (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    name      TEXT NOT NULL UNIQUE
);

-- ============================
-- 5. ASSOCIATION (EXTENSIBLE)
-- ============================

CREATE TABLE association (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    type_id       INTEGER NOT NULL,
    archetype_id  INTEGER NOT NULL,
    card_id       INTEGER,
    value         TEXT NOT NULL,
    meaning       TEXT,
    FOREIGN KEY(type_id) REFERENCES association_type(id),
    FOREIGN KEY(archetype_id) REFERENCES archetype(id),
    FOREIGN KEY(card_id) REFERENCES card(id)
);

-- ============================
-- 6. SETTING (APP SETTINGS)
-- ============================

CREATE TABLE settings (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    sort      TEXT NOT NULL,
    key       TEXT NOT NULL,
    value     TEXT
);

-- ============================
-- 7. INDEXES
-- ============================

CREATE INDEX idx_assoc_type ON association(type_id);
CREATE INDEX idx_assoc_archetype ON association(archetype_id);
CREATE INDEX idx_assoc_card ON association(card_id);