
DROP TABLE IF EXISTS weapons_materials;

DROP TABLE IF EXISTS materials;
DROP TABLE IF EXISTS weapons;

DROP TABLE IF EXISTS weapons_type;


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


CREATE TABLE weapons_materials (
id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_weapon INT UNSIGNED,
id_material INT UNSIGNED,
FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon),
FOREIGN KEY (id_material) REFERENCES materials(id_material)
);

CREATE TABLE weapons_types(
id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
type varchar (24),
description TEXT,
icon VARCHAR (16)
);

Insert INTO weapons_types (type, description, icon)
Values ("Melee", "Cuerpo a cuerpo", "melee.png"),
("Range", "Distancia", "range.png");