BEGIN;

INSERT INTO g2p_partners
(
    partner_id,
    partner_mnemonic,
    keymanager_reference_id,
    is_active
) VALUES (
    'P1',
    'civilregistry.example.org',
    'PARTNER1',
    TRUE
), (
    'P2',
    'https://integrating-server.com',
    'PARTNER2',
    TRUE
)
ON CONFLICT (partner_id) DO NOTHING;

COMMIT;