BEGIN;

INSERT INTO g2p_partner
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
)
ON CONFLICT (partner_id) DO NOTHING;

COMMIT;