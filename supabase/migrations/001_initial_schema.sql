CREATE TABLE companies (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  website VARCHAR(500),
  logo_url VARCHAR(500),
  founded_year INTEGER,
  headquarters_city VARCHAR(100),
  headquarters_canton VARCHAR(50),
  employee_count_min INTEGER,
  employee_count_max INTEGER,
  funding_total_chf BIGINT,
  funding_stage VARCHAR(50),
  valuation_chf BIGINT,
  is_public BOOLEAN DEFAULT false,
  stock_ticker VARCHAR(20),
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE company_categories (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  slug VARCHAR(100) NOT NULL UNIQUE,
  description TEXT,
  color VARCHAR(7)
);

CREATE TABLE company_category_map (
  company_id UUID REFERENCES companies(id) ON DELETE CASCADE,
  category_id UUID REFERENCES company_categories(id) ON DELETE CASCADE,
  PRIMARY KEY (company_id, category_id)
);

CREATE TABLE company_tags (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  slug VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE company_tag_map (
  company_id UUID REFERENCES companies(id) ON DELETE CASCADE,
  tag_id UUID REFERENCES company_tags(id) ON DELETE CASCADE,
  PRIMARY KEY (company_id, tag_id)
);

CREATE TABLE funding_rounds (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  company_id UUID REFERENCES companies(id) ON DELETE CASCADE,
  round_type VARCHAR(50),
  amount_chf BIGINT,
  announced_date DATE,
  lead_investor VARCHAR(255),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE ai_domains (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  slug VARCHAR(100) NOT NULL UNIQUE,
  description TEXT
);

CREATE TABLE company_domain_map (
  company_id UUID REFERENCES companies(id) ON DELETE CASCADE,
  domain_id UUID REFERENCES ai_domains(id) ON DELETE CASCADE,
  is_primary BOOLEAN DEFAULT false,
  PRIMARY KEY (company_id, domain_id)
);

CREATE INDEX idx_companies_canton ON companies(headquarters_canton);
CREATE INDEX idx_companies_funding_stage ON companies(funding_stage);
CREATE INDEX idx_companies_founded_year ON companies(founded_year);
CREATE INDEX idx_companies_funding_total ON companies(funding_total_chf);
