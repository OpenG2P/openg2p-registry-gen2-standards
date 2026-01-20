BEGIN;

INSERT INTO "public"."g2p_administrative_area_large" ("area_id","area_mnemonic","area_description") VALUES 
('AWn3s2RqgAN','Central','Central'),
('KozcEjeTyuD','Sulaka','Sulaka'),
('B1u1bVtIA92','Pualula','Pualula'),
('dbTLdTi7s8F','Chuminga','Chuminga');

INSERT INTO "public"."g2p_administrative_area_small" ("area_id","area_mnemonic","area_description","administrative_area_large_id") VALUES 
('oEBf29y8JP8','Ibombo','Ibombo','AWn3s2RqgAN'),
('HPGiE9Jjh2r','Ilanga','Ilanga','KozcEjeTyuD'),
('BxrIbNW7f3K','Embe','Embe','B1u1bVtIA92'),
('SQT8xjbvWwf','Ama','Ama','dbTLdTi7s8F'),
('ntoX1PkiWri','Isamba','Isamba','AWn3s2RqgAN'),
('SvFNQpplnch','Irundu','Irundu','KozcEjeTyuD'),
('NLjvK1QsrN3','Ienge','Ienge','B1u1bVtIA92'),
('hywxVKv48Xp','Nsali','Nsali','dbTLdTi7s8F'),
('QTtxiWj8ONP','Itambo','Itambo','AWn3s2RqgAN'),
('Oapn6R4rt3D','Zobwe','Zobwe','KozcEjeTyuD'),
('idR0pJWLqcR','Funabuli','Funabuli','B1u1bVtIA92'),
('jCJxK8sFH40','Soka','Soka','dbTLdTi7s8F'),
('ydyJb1RAy4U','Ezhi','Ezhi','AWn3s2RqgAN'),
('nO68NTtcdw2','Afue','Afue','KozcEjeTyuD'),
('FuvOOwvBw0p','Pili','Pili','B1u1bVtIA92'),
('R22tRIhdm5Y','Chibiya','Chibiya','dbTLdTi7s8F');

INSERT INTO g2p_partners (partner_id, partner_mnemonic, keymanager_reference_id, is_active) VALUES 
('P1', 'civilregistry.example.org', 'PARTNER1', TRUE), 
('P2', 'https://integrating-server.com', 'PARTNER2', TRUE)
ON CONFLICT (partner_id) DO NOTHING;

COMMIT;