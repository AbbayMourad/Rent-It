/* les deux comptes MYSQL utilises par notre application */
CREATE USER 'user'@'%' identified by 'user'; /* compte MYSQL utilise par les utilisateurs */
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`vehicule` TO 'user'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`client` TO 'user'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`contrat` TO 'user'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`parking` TO 'user'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`reservation` TO 'user'@'%'
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`facture` TO 'user'@'%'
GRANT SELECT ON `agence`.`utilisateur` TO 'user'@'%';
GRANT SELECT ON `agence`.`administrateur` TO 'user'@'%';

CREATE USER 'admin_agence'@'%' indentified by 'admin'; /* compte MYSQL utilise par admin */
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`client` TO 'admin_agence'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`facture` TO 'admin_agence'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`parking` TO 'admin_agence'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`contrat` TO 'admin_agence'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`reservation` TO 'admin_agence'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`utilisateur` TO 'admin_agence'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `agence`.`vehicule` TO 'admin_agence'@'%';
GRANT SELECT ON `agence`.`administrateur` TO 'admin_agence'@'%';
