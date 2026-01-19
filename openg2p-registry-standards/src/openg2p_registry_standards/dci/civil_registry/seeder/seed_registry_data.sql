BEGIN;

INSERT INTO data_models (
    data_model_id,
    data_model_mnemonic,
    pattern_for_data_model,
    response_template_file_id,
    is_active
) VALUES 
(
    'DM1',
    'DCI',
    '$.body.message.search_request[0].data.reg_record_type=>(?i).*dci.*',
    'dci_commons_response.json.j2',
    TRUE
),
(
    'DM2',
    'DCIVC',
    '$.body.message.search_request[0].data.reg_record_type=>(?i).*dcivc.*',
    'dci_commons_response.json.j2',
    TRUE
)

ON CONFLICT (data_model_id) DO NOTHING;

INSERT INTO incoming_model_key_paths (
    key_path_id,
    data_model_id,
    key_path_for_message_id,
    key_path_for_sender,
    key_path_for_signature,
    key_path_for_signature_payload,
    is_list,
    key_path_for_list_elements
) VALUES 
(
    'KP1',
    'DM1',
    '$.body.header.message_id',
    '$.body.header.sender_id',
    '$.body.signature',
    '$.body[''header'',''message'']',
    FALSE,
    ''  -- required but unused when is_list = false
),
(
    'KP2',
    'DM2',
    '$.body.header.message_id',
    '$.body.header.sender_id',
    '$.body.signature',
    '$.body[''header'',''message'']',
    FALSE,
    ''  -- required but unused when is_list = false
)
ON CONFLICT (key_path_id) DO NOTHING;

INSERT INTO incoming_model_semantic_patterns (
    semantic_pattern_id,
    data_model_id,
    register_id,
    section_id,
    pattern_for_register,
    pattern_for_section,
    key_path_for_business_payload,
    raw_payload_enricher_class
) VALUES 
(
    'SP1',
    'DM1',
    'FamilyMember',
    'section1',
    '$.body.message.search_response[0].data.reg_type=>^ns:org:RegistryType:Civil$',
    '$.body.message.search_response[0].data.reg_record_type=>^spdci-extensions-dci:Person$',
    '$.body.message.search_response[0].data.reg_records[0]',
    'G2PDciFamilyMemberCreateEnricherService'
),
(
    'SP2',
    'DM2',
    'FamilyMember',
    'section1',
    '$.body.message.vct=>^crvs_birth_v1$',
    '$.body.message.vct=>^crvs_birth_v1$',
    '$.body.message.credential_subject',
    'G2PDciVcFamilyMemberCreateEnricherService'
)
ON CONFLICT (semantic_pattern_id) DO NOTHING;

INSERT INTO incoming_templates (
    template_id,
    register_id,
    data_model_id,
    template_file_id,
    jsonld_expansion_required
) VALUES
(
    'TPL1',
    'FamilyMember',
    'DM1',
    'dci_2_openg2p.json.j2',
    TRUE
),
(
    'TPL2',
    'FamilyMember',
    'DM2',
    'dcivc_2_openg2p.json.j2',
    FALSE
)
ON CONFLICT ON CONSTRAINT uix_dro_2 DO NOTHING;

INSERT INTO g2p_register_sections (
    register_id,
    tab_id,
    section_id,
    section_register_id,
    is_primary_section,
    section_mnemonic,
    section_description,
    documents_required,
    no_of_verifications_required,
    auto_approval,
    is_list,
    section_ui_schema
)
VALUES
(
    'FamilyMember',  -- replace later
    'TAB1',          -- replace later
    'uuid-123',      -- auto-generate UUID
    'section1',      -- replace later
    FALSE,
    'section1',      -- replace later
    NULL,
    FALSE,
    2,
    FALSE,
    FALSE,
    NULL
);

COMMIT;
