USE sql10826582;

-- =====================================
-- XP GAMES DATABASE
-- OTIMIZADA PARA 5MB
-- =====================================

-- USUÁRIOS

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,

    nome VARCHAR(60) NOT NULL,

    email VARCHAR(120) NOT NULL UNIQUE,

    senha VARCHAR(255) NOT NULL,

    admin TINYINT(1) DEFAULT 0,

    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CATEGORIAS

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,

    nome VARCHAR(40) NOT NULL UNIQUE
);

-- JOGOS

CREATE TABLE jogos (
    id INT AUTO_INCREMENT PRIMARY KEY,

    categoria_id INT,

    titulo VARCHAR(120) NOT NULL,

    descricao VARCHAR(300),

    preco DECIMAL(10,2) NOT NULL,

    imagem VARCHAR(255),

    estoque SMALLINT DEFAULT 0,

    destaque TINYINT(1) DEFAULT 0,

    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (categoria_id)
    REFERENCES categorias(id)
    ON DELETE SET NULL
);

-- CARRINHO

CREATE TABLE carrinho (
    id INT AUTO_INCREMENT PRIMARY KEY,

    usuario_id INT NOT NULL,

    jogo_id INT NOT NULL,

    quantidade TINYINT DEFAULT 1,

    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
    ON DELETE CASCADE,

    FOREIGN KEY (jogo_id)
    REFERENCES jogos(id)
    ON DELETE CASCADE
);

-- PEDIDOS

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,

    usuario_id INT NOT NULL,

    total DECIMAL(10,2) NOT NULL,

    status_pedido VARCHAR(20) DEFAULT 'Pendente',

    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
    ON DELETE CASCADE
);

-- ITENS PEDIDO

CREATE TABLE pedido_itens (
    id INT AUTO_INCREMENT PRIMARY KEY,

    pedido_id INT NOT NULL,

    jogo_id INT NOT NULL,

    quantidade TINYINT NOT NULL,

    preco DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (pedido_id)
    REFERENCES pedidos(id)
    ON DELETE CASCADE,

    FOREIGN KEY (jogo_id)
    REFERENCES jogos(id)
    ON DELETE CASCADE
);

-- FAVORITOS

CREATE TABLE favoritos (
    id INT AUTO_INCREMENT PRIMARY KEY,

    usuario_id INT NOT NULL,

    jogo_id INT NOT NULL,

    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
    ON DELETE CASCADE,

    FOREIGN KEY (jogo_id)
    REFERENCES jogos(id)
    ON DELETE CASCADE
);

-- =====================================
-- DADOS INICIAIS
-- =====================================

INSERT INTO categorias (nome)
VALUES
('Ação'),
('RPG'),
('FPS'),
('Corrida');

INSERT IGNORE INTO categorias (nome)
VALUES
('Ação'),
('RPG'),
('Corrida'),
('Terror'),
('FPS'),
('Aventura'),
('Esportes'),
('Estratégia');

VALUES

(
    1,
    'Cyber Battle',
    'FPS futurista cyberpunk.',
    89.90,
    'https://i.imgur.com/game1.jpg',
    50,
    1
),

(
    4,
    'Racing Legends',
    'Corridas em ultra velocidade.',
    59.90,
    'https://i.imgur.com/game2.jpg',
    25,
    1
),

(
    2,
    'Pixel Warriors',
    'RPG retrô em mundo aberto.',
    39.90,
    'https://i.imgur.com/game3.jpg',
    100,
    1
);
-- =========================================
-- CATEGORIAS
-- =========================================

INSERT INTO categorias (nome)
VALUES
('Ação'),
('RPG'),
('Corrida'),
('Terror'),
('FPS'),
('Aventura'),
('Esportes'),
('Estratégia');

-- =========================================
-- JOGOS (POPULAÇÃO MAIOR)
-- =========================================

INSERT INTO jogos (
    categoria_id,
    titulo,
    descricao,
    preco,
    imagem,
    estoque,
    destaque
)
VALUES

-- AÇÃO
(1, 'Cyber Battle', 'FPS cyberpunk com guerras futuristas intensas.', 89.90, 'cyber1.jpg', 50, TRUE),
(1, 'Urban Strike', 'Combate urbano tático em primeira pessoa.', 69.90, 'urban.jpg', 40, FALSE),
(1, 'Metal Warzone', 'Guerra moderna com explosões realistas.', 79.90, 'metal.jpg', 30, TRUE),

-- RPG
(2, 'Pixel Warriors', 'RPG retrô em mundo aberto cheio de magia.', 39.90, 'pixel.jpg', 80, TRUE),
(2, 'Dragon Realm', 'Derrote dragões e evolua seu personagem.', 59.90, 'dragon.jpg', 60, TRUE),
(2, 'Mystic Souls', 'RPG sombrio com escolhas que mudam o destino.', 99.90, 'mystic.jpg', 25, FALSE),

-- CORRIDA
(3, 'Racing Legends', 'Corridas ultra rápidas com carros lendários.', 59.90, 'race1.jpg', 30, TRUE),
(3, 'Neon Drift', 'Drift futurista em cidades neon.', 49.90, 'neon.jpg', 45, TRUE),
(3, 'Speed Horizon', 'Corridas em mundo aberto gigante.', 89.90, 'speed.jpg', 20, FALSE),

-- TERROR
(4, 'Dark House', 'Uma casa assombrada cheia de segredos.', 29.90, 'dark.jpg', 70, TRUE),
(4, 'Night Scream', 'Sobreviva à noite contra criaturas.', 39.90, 'night.jpg', 50, TRUE),
(4, 'Silent Fear', 'Terror psicológico intenso e imersivo.', 59.90, 'silent.jpg', 35, FALSE),

-- FPS
(5, 'War Front', 'Guerra global multiplayer competitivo.', 79.90, 'warfront.jpg', 60, TRUE),
(5, 'Bullet Storm', 'Ação frenética com tiros sem parar.', 69.90, 'bullet.jpg', 55, TRUE),
(5, 'Sniper Elite X', 'Missões de sniper em mapas realistas.', 89.90, 'sniper.jpg', 40, FALSE),

-- AVENTURA
(6, 'Lost Island', 'Explore uma ilha misteriosa cheia de segredos.', 59.90, 'island.jpg', 65, TRUE),
(6, 'Jungle Quest', 'Aventura na selva com puzzles e exploração.', 49.90, 'jungle.jpg', 50, FALSE),

-- ESPORTES
(7, 'Street Football', 'Futebol de rua competitivo e divertido.', 39.90, 'football.jpg', 80, TRUE),
(7, 'Pro Basketball', 'Simulador realista de basquete.', 69.90, 'basket.jpg', 40, FALSE),

-- ESTRATÉGIA
(8, 'Kingdom Builder', 'Construa e gerencie seu império.', 59.90, 'kingdom.jpg', 45, TRUE),
(8, 'War Tactics', 'Estratégia militar por turnos.', 79.90, 'tactics.jpg', 30, FALSE);

SELECT * FROM jogos;