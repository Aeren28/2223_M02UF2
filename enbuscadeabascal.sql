-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS characters_armours;
DROP TABLE IF EXISTS characters_items;

DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;

DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS armours;
DROP TABLE IF EXISTS weapons;

DROP TABLE IF EXISTS items_types;
DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS armours_types;

DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS characters;


-_-_-CHARACTERS-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

CREATE TABLE characters(
id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(32),
age INT UNSIGNED,
race VARCHAR(16),
gender CHAR(1),
class VARCHAR(16),
height FLOAT,
weight FLOAT,
origin TEXT,
description TEXT
);

INSERT INTO characters (name,age,race,gender,class,height,weight,origin) 
VALUES ("Payoh",64,"Cambiapieles","L","Dictador",1.75,80,"RUM"),
("Yuca",27,"Sirenido","F","Cryptolay",1,40,"PUR"),
("Yulen",104,"No-muerto","D","Minero",0.85,25,"NDE"),
("Josema",3000,"Deidad","T","Procrastinador",3,"0","PER");


-_-_-MATERIALS-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE materials(
id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
material CHAR (16),
color CHAR (6),
cost FLOAT
);

INSERT INTO materials (material,color,cost) 
VALUES ("Obsidiana","000000",40),
("Carne","ffff00",10),
("Pana","ffdddd",50),
("Goma sagrada","ffffff",1000),
("Metal","cccccc",1),
("Cuero","ddddaa",20),
("Madera","dddaa",10),
("Plumas de angel","ffffff",10000),
("Materia oscura","000000",40),
("Hueso","cccccc",10);


-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE armours_types (
id_armour_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
type varchar (24),
description TEXT,
icon VARCHAR (16)
);

INSERT INTO armours_types (type, description, icon)
VALUES ("Peto","Pal pexito", "peto.png"),
("Traje", "Pal cuerpesito", "traje.png"),
("Casco", "Pal cabesa", "casco.png");


-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE weapons_types(
id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
type varchar (24),
description TEXT,
icon VARCHAR (16)
);

Insert INTO weapons_types (type, description, icon)
Values ("Melee", "Cuerpo a cuerpo", "melee.png"),
("Range", "Distancia", "range.png"),
("Magical","Magia potagia","magic.png"),
("Divine","Es divino", "divine.png");


-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE items_types(
id_item_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
type varchar (24),
description TEXT,
icon VARCHAR (16)
);

INSERT INTO items_types (type,description, icon)
VALUES ("Comida", "alimento rico", "food.png"),
("Poción", "te cura o te mata o lo que sea", "pocion.png"),
("Tesoro", "$_$", "tesoro.png");


-_-_-WEAPONS-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE weapons(
id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
weapon VARCHAR(24),
grip INT,
durability INT,
distance FLOAT,
quality INT,
physic_attack FLOAT,
physic_defense FLOAT,
magic_attack FLOAT,
magic_defense FLOAT,
description TEXT,
`level` INT,
level_min INT,
id_weapon_type INT UNSIGNED,
FOREIGN KEY (id_weapon_type) REFERENCES weapons_types (id_weapon_type)
);

INSERT INTO weapons (weapon, grip, durability, distance, quality, physic_attack, physic_defense, magic_attack, magic_defense, description, `level`, level_min, id_weapon_type) 
VALUES ("Brazo de bebé", 1, 100, 0.5, 0, 0, 0, 0, 0, " ", 1, 0, 1),
("Estelada", 1, 1714, 3, 100, 1, 1, 1, 1, "Bandera con una estrella :D", 101, 100, 1),
("Biblia", 1, 1000, 10, 1000, 50, 45, 60, 55, "El mejor libro de ficción del mundo", 2023, 0, 2),
("Espada de Yi", 1, 900, 2, 500, 300, 200, -1, 100, "Una arma bastante dumb", 11, 2, 1);


-_-_-ARMOUR-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE armours(
id_armour INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
armour VARCHAR(24),
weight FLOAT,
class VARCHAR(16),
magic_defense FLOAT,
physic_defense FLOAT,
durability INT,
`level` INT,
level_min INT,
cost FLOAT,
rarity INT,
description TEXT,
notriety INT,
id_armour_type INT UNSIGNED,
FOREIGN KEY (id_armour_type) REFERENCES armours_types (id_armour_type)
);

INSERT INTO armours (armour, weight, class, magic_defense, physic_defense, durability, `level`, level_min, cost, rarity, description, notriety, id_armour_type) 
VALUES ("Túnica de Asesino", 0.5, "Asesino", 100, 300, 400, 50, 30, 1500, 300, "Túnica perfecta pa que no te vean", 1, 2),
("Kronus de jagged helmet", 30,"Paladin", 300, 120, -1, 120, 99, -1, 999, "Casco hecho para dioses", 80, 1);


-_-_-ITEMS-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE items(
id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
item VARCHAR(24),
consumible BOOLEAN,
cost FLOAT,
`key` BOOLEAN,
rarity INT,
weight FLOAT,
`usage` INT,
fusionable BOOLEAN,
width FLOAT,
height FLOAT,
durability INT,
description TEXT,
disassamble BOOLEAN,
id_item_type INT UNSIGNED,
FOREIGN KEY (id_item_type) REFERENCES items_types (id_item_type)
);

INSERT INTO items (item, consumible, cost, `key`, rarity, weight, `usage`, fusionable, width, height, durability, description, disassamble, id_item_type) 
VALUES ("Queso", true, 50, false, 3, 20, 1, true, 0.1, 0.1, 3, "Queso que sabe a beso", false, 1),
("Carne de Zombie", true, 20, false, 2, 40, 1, true, 0.3, 0.3, 1, "Esto huele mal", false, 1);


-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE armours_materials (
id_armours_materials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_material INT UNSIGNED,
id_armour INT UNSIGNED,
FOREIGN KEY (id_armour) REFERENCES armours (id_armour),
FOREIGN KEY (id_material) REFERENCES materials (id_material)
);

INSERT INTO armours_materials (id_armour,id_material) 
VALUES (1,5),
(2,6),
(2,3),
(2,5),
(1,8),
(2,1);


-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE weapons_materials (
id_weapons_materials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_weapon INT UNSIGNED,
id_material INT UNSIGNED,
FOREIGN KEY (id_material) REFERENCES materials(id_material),
FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon)
);

INSERT INTO weapons_materials (id_weapon,id_material) 
VALUES (1,5),
(1,6),
(1,3),
(2,5),
(2,7),
(2,6),
(3,7),
(3,9);


-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE characters_items (
id_character_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_character INT UNSIGNED,
id_item INT UNSIGNED,
FOREIGN KEY (id_item) REFERENCES items (id_item),
FOREIGN KEY (id_character) REFERENCES characters (id_character)
);

INSERT INTO characters_items (id_character,id_item) 
VALUES (1,1),
(2,1),
(3,1),
(3,2),
(4,2),
(4,1);


-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE characters_armours (
id_character_armour INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_character INT UNSIGNED,
id_armour INT UNSIGNED,
FOREIGN KEY (id_armour) REFERENCES armours (id_armour),
FOREIGN KEY (id_character) REFERENCES characters (id_character)
);

INSERT INTO characters_armours (id_character,id_armour) 
VALUES (1,1),
(2,2),
(3,1),
(4,2);


-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE characters_weapons(
id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_character INT UNSIGNED,
id_weapon INT UNSIGNED,
FOREIGN KEY (id_character) REFERENCES characters (id_character), 
FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon)
);

INSERT INTO characters_weapons (id_character, id_weapon)
VALUES (1,1),
(4,3),
(4,1);


-_-_-STATS-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


CREATE TABLE stats(
id_stat INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
agility FLOAT,
hp FLOAT,
hp_max INT,
xp FLOAT,
xp_max INT,
mp FLOAT,
mp_max INT,	
`level` INT,
physic_attack FLOAT,
physic_defense FLOAT,
magic_attack FLOAT,
magic_defense FLOAT,
stamina FLOAT,
stamina_max INT,
intel INT,
stealth INT,
luck INT,
faith INT,
velocity INT,
dexterity INT,
strenght INT,
tenacity INT,
vigor INT,
charisma INT,
critical_rate INT,
id_character INT UNSIGNED,
FOREIGN KEY (id_character) REFERENCES characters (id_character)
);

INSERT INTO stats (agility,hp,hp_max,xp,xp_max,mp,mp_max,`level`,physic_attack,physic_defense,magic_attack,magic_defense,stamina,stamina_max,intel,stealth,luck,faith,velocity,dexterity,strenght,tenacity,vigor,charisma,critical_rate,id_character) 
VALUES (900,950,0,820,0,300,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
(75,0,0,500,0,700,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3),
(1000,1000,0,999,0,1000,0,69,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4),
(200,600,0,150,0,750,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2);

-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_



