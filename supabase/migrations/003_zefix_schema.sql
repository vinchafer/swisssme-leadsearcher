-- Add Zefix fields to existing companies table
ALTER TABLE companies ADD COLUMN IF NOT EXISTS uid_chid VARCHAR(20) UNIQUE;
ALTER TABLE companies ADD COLUMN IF NOT EXISTS zefix_ehraid BIGINT;
ALTER TABLE companies ADD COLUMN IF NOT EXISTS legal_form_code VARCHAR(10);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS legal_form_name VARCHAR(100);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS purpose_text TEXT;
ALTER TABLE companies ADD COLUMN IF NOT EXISTS capital_chf BIGINT;
ALTER TABLE companies ADD COLUMN IF NOT EXISTS capital_currency VARCHAR(10);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS has_auditor BOOLEAN;
ALTER TABLE companies ADD COLUMN IF NOT EXISTS auditor_name VARCHAR(255);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS street VARCHAR(255);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS house_number VARCHAR(20);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS zip_code VARCHAR(10);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS country_code VARCHAR(5) DEFAULT 'CH';
ALTER TABLE companies ADD COLUMN IF NOT EXISTS data_source VARCHAR(20) DEFAULT 'manual';
ALTER TABLE companies ADD COLUMN IF NOT EXISTS zefix_last_sync TIMESTAMPTZ;
ALTER TABLE companies ADD COLUMN IF NOT EXISTS noga_code VARCHAR(10);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS noga_label_de VARCHAR(255);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS noga_label_fr VARCHAR(255);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS noga_confidence FLOAT;
ALTER TABLE companies ADD COLUMN IF NOT EXISTS noga_matched_at TIMESTAMPTZ;
ALTER TABLE companies ADD COLUMN IF NOT EXISTS employee_count INTEGER;
ALTER TABLE companies ADD COLUMN IF NOT EXISTS employee_range VARCHAR(30);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS crawled_at TIMESTAMPTZ;
ALTER TABLE companies ADD COLUMN IF NOT EXISTS linkedin_url VARCHAR(500);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS twitter_url VARCHAR(500);
ALTER TABLE companies ADD COLUMN IF NOT EXISTS extra_data JSONB DEFAULT '{}';

-- NOGA codes reference table
CREATE TABLE IF NOT EXISTS noga_codes (
  code VARCHAR(10) PRIMARY KEY,
  label_de VARCHAR(255) NOT NULL,
  label_fr VARCHAR(255),
  label_it VARCHAR(255),
  label_en VARCHAR(255),
  section VARCHAR(5),
  section_label_de VARCHAR(255),
  division VARCHAR(5),
  group_code VARCHAR(5),
  class_code VARCHAR(5),
  level INTEGER
);

-- Zefix sync log table
CREATE TABLE IF NOT EXISTS zefix_sync_log (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  started_at TIMESTAMPTZ DEFAULT NOW(),
  finished_at TIMESTAMPTZ,
  canton VARCHAR(5),
  total_fetched INTEGER DEFAULT 0,
  total_inserted INTEGER DEFAULT 0,
  total_updated INTEGER DEFAULT 0,
  total_errors INTEGER DEFAULT 0,
  status VARCHAR(20) DEFAULT 'running',
  error_message TEXT
);

-- Performance indexes for 500k companies
CREATE INDEX IF NOT EXISTS idx_companies_uid ON companies(uid_chid);
CREATE INDEX IF NOT EXISTS idx_companies_zip ON companies(zip_code);
CREATE INDEX IF NOT EXISTS idx_companies_legal_form ON companies(legal_form_code);
CREATE INDEX IF NOT EXISTS idx_companies_noga ON companies(noga_code);
CREATE INDEX IF NOT EXISTS idx_companies_has_auditor ON companies(has_auditor);
CREATE INDEX IF NOT EXISTS idx_companies_data_source ON companies(data_source);
CREATE INDEX IF NOT EXISTS idx_companies_name_search ON companies USING gin(to_tsvector('german', name));
CREATE INDEX IF NOT EXISTS idx_companies_purpose_search ON companies USING gin(to_tsvector('german', coalesce(purpose_text, '')));
