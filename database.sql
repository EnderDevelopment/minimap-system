CREATE TABLE IF NOT EXISTS mini_map_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    size FLOAT NOT NULL,
    position_x FLOAT NOT NULL,
    position_y FLOAT NOT NULL,
    visible BOOLEAN NOT NULL
);

INSERT INTO mini_map_settings (player_id, size, position_x, position_y, visible) VALUES (1, 0.2, 0.15, 0.15, true);