DROP SCHEMA IF EXISTS pokemon_db;
CREATE SCHEMA pokemon_db;
USE pokemon_db;

-- 1. Pokémon Table
CREATE TABLE pokemon (
    pokemon_id INT PRIMARY KEY,
    name VARCHAR(50),
    form VARCHAR(20),
    type_1 VARCHAR(20),
    type_2 VARCHAR(20) NULL,
    base_hp INT,
    base_attack INT,
    base_defense INT,
    base_sp_attack INT,
    base_sp_defense INT,
    base_speed INT,
    is_legendary BOOLEAN,
    mega_evolution_id INT NULL
);

-- 2. Moves Table
CREATE TABLE moves (
    move_id INT PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(20),
    category ENUM('Physical', 'Special', 'Status'),
    power INT NULL,
    accuracy INT NULL,
    pp INT,
    priority INT,
    effect TEXT NULL
);

-- 3. Abilities Table
CREATE TABLE abilities (
    ability_id INT PRIMARY KEY,
    name VARCHAR(50),
    description TEXT
);

-- 4. Items Table
CREATE TABLE items (
    item_id INT PRIMARY KEY,
    name VARCHAR(50),
    effect TEXT NULL,
    is_consumable BOOLEAN
);

-- 5. Pokemon Moves Table (Many-to-Many)
CREATE TABLE pokemon_moves (
    pokemon_id INT,
    move_id INT,
    method ENUM('Level-Up', 'TM', 'Egg', 'Tutor'),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    FOREIGN KEY (move_id) REFERENCES moves(move_id),
    PRIMARY KEY (pokemon_id, move_id)
);

-- 6. Pokemon Abilities Table (Many-to-Many)
CREATE TABLE pokemon_abilities (
    pokemon_id INT,
    ability_id INT,
    slot ENUM('Primary', 'Secondary', 'Hidden'),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    FOREIGN KEY (ability_id) REFERENCES abilities(ability_id),
    PRIMARY KEY (pokemon_id, ability_id)
);

-- 9. User Table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    password_hash VARCHAR(255),
    created_at TIMESTAMP
);

-- 7. Team Table
CREATE TABLE teams (
    team_id INT PRIMARY KEY,
    user_id INT NULL,
    team_name VARCHAR(50) NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) -- Assuming users table is created before
);


-- 8. Team Pokémon Table
CREATE TABLE team_pokemon (
    team_id INT,
    pokemon_id INT,
    nickname VARCHAR(50) NULL,
    item_id INT NULL,
    ability_id INT,
    move_1 INT,
    move_2 INT,
    move_3 INT,
    move_4 INT,
    level INT,
    ev_hp INT,
    ev_attack INT,
    ev_defense INT,
    ev_sp_attack INT,
    ev_sp_defense INT,
    ev_speed INT,
    iv_hp INT,
    iv_attack INT,
    iv_defense INT,
    iv_sp_attack INT,
    iv_sp_defense INT,
    iv_speed INT,
    nature VARCHAR(20),
    FOREIGN KEY (team_id) REFERENCES teams(team_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id),
    FOREIGN KEY (ability_id) REFERENCES abilities(ability_id),
    FOREIGN KEY (move_1) REFERENCES moves(move_id),
    FOREIGN KEY (move_2) REFERENCES moves(move_id),
    FOREIGN KEY (move_3) REFERENCES moves(move_id),
    FOREIGN KEY (move_4) REFERENCES moves(move_id),
    PRIMARY KEY (team_id, pokemon_id)
);


