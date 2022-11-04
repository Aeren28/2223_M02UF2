
-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS items_types;

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

-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


DROP TABLE IF EXISTS armours;
DROP TABLE IF EXISTS armours_types;

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

-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS weapons_types;

CREATE TABLE weapons_types(
id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
type varchar (24),
description TEXT,
icon VARCHAR (16)
);

Insert INTO weapons_types (type, description, icon)
Values ("Melee", "Cuerpo a cuerpo", "melee.png"),
("Range", "Distancia", "range.png");

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

-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


DROP TABLE IF EXISTS characters_weapons;

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

-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_


DROP TABLE IF EXISTS materials;
DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;


CREATE TABLE weapons_materials (
id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_weapon INT UNSIGNED,
id_material INT UNSIGNED,
FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon),
FOREIGN KEY (id_material) REFERENCES materials(id_material)
);

CREATE TABLE armours_materials (
id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_material INT UNSIGNED,
id_armour INT UNSIGNED,
FOREIGN KEY (id_armour) REFERENCES armours(id_armour), 
FOREIGN KEY (id_material) REFERENCES materials(id_material)
);

CREATE TABLE materials (
id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT, 
material VARCHAR(16),
color CHAR(6),
cost FLOAT 
);

INSERT INTO materials (material, color, cost) VALUES ("Obsidiana", "000000", 40),
("Madera", "ddeeaa", 10),
("Carne", "ffff00", 5),
("Pana", "ffdddd", 50),
("Piedra", "cccccc", 1),
("Goma Sagrada", "000000", 1000),
("Plumas de Angel", "ffffff", 10000),
("Materia Oscura", "000000", 10000),
("Bandera España", "ESPAÑA", 2030),
("Hueso", "dddddd", 10),
("Agua", "0000ff", 1),
("Lava", "ff0000", 500),
("Cuero", "ddddaa", 20);


