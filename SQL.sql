CREATE TABLE `material` (
  `id_material` int PRIMARY KEY,
  `tipus_dispositiu` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `num_serie` varchar(255) UNIQUE NOT NULL,
  `ubicacio` varchar(255) NOT NULL,
  `data_adquisicio` date NOT NULL,
  `num_inventari` varchar(255),
  `tipus_ordinador` ENUM ('insti', 'dep'),
  `mac_ethernet` varchar(255) UNIQUE,
  `mac_wifi` varchar(255) UNIQUE,
  `sace` varchar(255) UNIQUE
);

CREATE TABLE `assignacio` (
  `id_assignacio` int PRIMARY KEY,
  `material_id` int NOT NULL,
  `alumne_id` int DEFAULT 0,
  `tipus_assignacio` ENUM ('Alumne', 'Cessio', 'Grup') NOT NULL,
  `ubicacio` varchar(255) NOT NULL,
  `grup_id` int DEFAULT 0,
  `data_inici` date NOT NULL,
  `data_fi` date,
  `finalitzat` ENUM ('si', 'no') NOT NULL DEFAULT "no"
);

CREATE TABLE `incidencia` (
  `id_incidencia` int PRIMARY KEY,
  `material_id` int NOT NULL,
  `alumne_id` int DEFAULT 0,
  `finalitzada` ENUM ('si', 'no') NOT NULL DEFAULT "no",
  `data` date NOT NULL,
  `observacions` varchar(255)
);

CREATE TABLE `alumne` (
  `id_alumne` int PRIMARY KEY,
  `nom_cognom` varchar(255) UNIQUE NOT NULL,
  `dni` varchar(255) UNIQUE NOT NULL,
  `horari` ENUM ('mati', 'tarde') NOT NULL,
  `telefon` int NOT NULL
);

CREATE TABLE `grup` (
  `id_grup` int PRIMARY KEY,
  `nom` varchar(255) NOT NULL,
  `modul` varchar(255) NOT NULL,
  `uf` varchar(255) NOT NULL,
  `cas` int NOT NULL
);

CREATE TABLE `grup_alumne` (
  `id` int PRIMARY KEY,
  `grup` int NOT NULL,
  `alumne` int NOT NULL
);

ALTER TABLE `assignacio` ADD FOREIGN KEY (`material_id`) REFERENCES `material` (`id_material`);

ALTER TABLE `assignacio` ADD FOREIGN KEY (`alumne_id`) REFERENCES `alumne` (`id_alumne`);

ALTER TABLE `assignacio` ADD FOREIGN KEY (`grup_id`) REFERENCES `grup` (`id_grup`);

ALTER TABLE `incidencia` ADD FOREIGN KEY (`material_id`) REFERENCES `material` (`id_material`);

ALTER TABLE `incidencia` ADD FOREIGN KEY (`alumne_id`) REFERENCES `alumne` (`id_alumne`);

ALTER TABLE `grup_alumne` ADD FOREIGN KEY (`grup`) REFERENCES `grup` (`id_grup`);

ALTER TABLE `grup_alumne` ADD FOREIGN KEY (`alumne`) REFERENCES `alumne` (`id_alumne`);
