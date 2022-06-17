/*
  Warnings:

  - You are about to drop the column `email` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[matricule]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `code_AL` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `code_activite` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `code_section` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `contrat` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `firstname` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastname` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `matricule` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `open_date` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `User_email_key` ON `User`;

-- AlterTable
ALTER TABLE `User` DROP COLUMN `email`,
    DROP COLUMN `name`,
    ADD COLUMN `code_AL` VARCHAR(255) NOT NULL,
    ADD COLUMN `code_activite` VARCHAR(255) NOT NULL,
    ADD COLUMN `code_section` VARCHAR(255) NOT NULL,
    ADD COLUMN `contrat` VARCHAR(255) NOT NULL,
    ADD COLUMN `firstname` VARCHAR(255) NOT NULL,
    ADD COLUMN `lastname` VARCHAR(255) NOT NULL,
    ADD COLUMN `matricule` VARCHAR(255) NOT NULL,
    ADD COLUMN `open_date` DATE NOT NULL,
    ADD COLUMN `password` VARCHAR(255) NULL,
    ADD COLUMN `roles` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER',
    ADD COLUMN `societe_interim` VARCHAR(255) NULL;

-- CreateTable
CREATE TABLE `Hoppoin` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `matricule` VARCHAR(255) NOT NULL,
    `date` DATE NOT NULL,
    `heure` TIME NOT NULL,
    `lecteur` VARCHAR(255) NULL,
    `typeve` INTEGER NOT NULL,
    `imput` VARCHAR(255) NULL,
    `dattrai` VARCHAR(255) NOT NULL,
    `hretrai` VARCHAR(255) NOT NULL,
    `duree` VARCHAR(255) NOT NULL,
    `sens` VARCHAR(255) NOT NULL,
    `modlec` VARCHAR(255) NULL,
    `anom01` VARCHAR(255) NOT NULL,
    `anom02` VARCHAR(255) NOT NULL,
    `anom03` VARCHAR(255) NOT NULL,
    `anom04` VARCHAR(255) NOT NULL,
    `utilmod` VARCHAR(255) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Metier` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `codeActivite` VARCHAR(255) NOT NULL,
    `metier` VARCHAR(255) NOT NULL,
    `libelle` VARCHAR(255) NOT NULL,
    `impactant` VARCHAR(255) NOT NULL,
    `service` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Activite` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `User_matricule_key` ON `User`(`matricule`);
