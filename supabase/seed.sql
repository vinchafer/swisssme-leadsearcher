-- =============================================
-- SEED DATA: Swiss AI Company Radar
-- =============================================

-- AI Domains
INSERT INTO ai_domains (name, slug, description) VALUES
  ('NLP', 'nlp', 'Natural Language Processing and text AI'),
  ('Computer Vision', 'computer-vision', 'Image and video understanding AI'),
  ('MLOps', 'mlops', 'Machine learning operations and infrastructure'),
  ('FinTech AI', 'fintech-ai', 'AI for financial services and banking'),
  ('HealthTech AI', 'healthtech-ai', 'AI for healthcare and life sciences'),
  ('Robotic AI', 'robotic-ai', 'AI for robotics and autonomous systems'),
  ('Data Analytics', 'data-analytics', 'AI-powered data analysis and business intelligence'),
  ('Generative AI', 'generative-ai', 'Generative models, LLMs, and creative AI'),
  ('Cybersecurity AI', 'cybersecurity-ai', 'AI for cybersecurity and threat detection'),
  ('Other', 'other', 'Other AI applications');

-- Company Categories
INSERT INTO company_categories (name, slug, description, color) VALUES
  ('B2B SaaS', 'b2b-saas', 'Business-to-business software as a service', '#3b82f6'),
  ('Deep Tech', 'deep-tech', 'Deep technology and research-driven companies', '#818cf8'),
  ('Platform', 'platform', 'Platform businesses and marketplaces', '#22c55e'),
  ('API', 'api', 'API-first products and developer tools', '#f97316'),
  ('Other', 'other', 'Other company types', '#888888');

-- Company Tags
INSERT INTO company_tags (name, slug) VALUES
  ('machine-learning', 'machine-learning'),
  ('deep-learning', 'deep-learning'),
  ('swiss-made', 'swiss-made'),
  ('enterprise', 'enterprise'),
  ('startup', 'startup'),
  ('scaleup', 'scaleup'),
  ('api-first', 'api-first'),
  ('open-source', 'open-source'),
  ('b2b', 'b2b'),
  ('b2c', 'b2c'),
  ('healthcare', 'healthcare'),
  ('finance', 'finance'),
  ('robotics', 'robotics'),
  ('nlp', 'nlp'),
  ('computer-vision', 'computer-vision'),
  ('data-platform', 'data-platform'),
  ('automation', 'automation'),
  ('analytics', 'analytics'),
  ('security', 'security'),
  ('generative', 'generative');

-- =============================================
-- COMPANIES (30+)
-- =============================================

INSERT INTO companies (name, slug, description, website, founded_year, headquarters_city, headquarters_canton, employee_count_min, employee_count_max, funding_total_chf, funding_stage, is_public) VALUES
  (
    'Sophia Genetics',
    'sophia-genetics',
    'AI-powered genomic analysis platform helping hospitals improve diagnosis of hereditary cancers and rare diseases through data-driven insights.',
    'https://www.sophiagenetics.com',
    2011,
    'Lausanne',
    'VD',
    500,
    1000,
    240000000,
    'Series E',
    false
  ),
  (
    'Scandit',
    'scandit',
    'Computer vision and barcode scanning platform enabling smart data capture for retail, logistics, healthcare and manufacturing.',
    'https://www.scandit.com',
    2009,
    'Zurich',
    'ZH',
    500,
    1000,
    150000000,
    'Series D',
    false
  ),
  (
    'Neural Concept',
    'neural-concept',
    'Deep learning platform for 3D engineering simulation, enabling faster product design through AI-driven predictive modeling.',
    'https://www.neuralconcept.com',
    2018,
    'Lausanne',
    'VD',
    50,
    100,
    30000000,
    'Series B',
    false
  ),
  (
    'Starmind',
    'starmind',
    'AI-powered knowledge management platform that connects employees with the right experts using neural network-inspired routing.',
    'https://www.starmind.com',
    2010,
    'Zurich',
    'ZH',
    100,
    200,
    50000000,
    'Series B',
    false
  ),
  (
    'Yokoy',
    'yokoy',
    'AI-driven spend management platform automating expense reports, supplier invoices, and corporate card processing for enterprises.',
    'https://www.yokoy.ai',
    2019,
    'Zurich',
    'ZH',
    200,
    500,
    80000000,
    'Series B',
    false
  ),
  (
    'Contovista',
    'contovista',
    'AI-powered personal finance management and data analytics solutions for banks and financial institutions.',
    'https://www.contovista.com',
    2013,
    'Zurich',
    'ZH',
    50,
    100,
    12000000,
    'Series A',
    false
  ),
  (
    'Picterra',
    'picterra',
    'Geospatial AI platform for automated object detection in satellite and aerial imagery, serving defense and infrastructure sectors.',
    'https://www.picterra.ch',
    2016,
    'Lausanne',
    'VD',
    20,
    50,
    5000000,
    'Seed',
    false
  ),
  (
    'Teralytics',
    'teralytics',
    'AI platform transforming mobile network data into movement intelligence for transportation planning and urban mobility.',
    'https://www.teralytics.net',
    2013,
    'Zurich',
    'ZH',
    50,
    100,
    15000000,
    'Series A',
    false
  ),
  (
    'Axon Vibe',
    'axon-vibe',
    'Location intelligence platform using AI to analyze mobility patterns and deliver real-time personalized experiences.',
    'https://www.axonvibe.com',
    2012,
    'Geneva',
    'GE',
    20,
    50,
    8000000,
    'Series A',
    false
  ),
  (
    'Seervision',
    'seervision',
    'AI-powered robotic camera technology for automated broadcast production, enabling unmanned studio operations.',
    'https://www.seervision.com',
    2018,
    'Zurich',
    'ZH',
    20,
    50,
    4000000,
    'Seed',
    false
  ),
  (
    'Wingtra',
    'wingtra',
    'Professional VTOL drone manufacturer using AI for precision mapping in surveying, mining, and agriculture applications.',
    'https://www.wingtra.com',
    2015,
    'Zurich',
    'ZH',
    100,
    200,
    22000000,
    'Series B',
    false
  ),
  (
    'Caplena',
    'caplena',
    'AI-powered text analytics platform for analyzing open-ended survey responses and customer feedback at scale.',
    'https://www.caplena.com',
    2018,
    'Zurich',
    'ZH',
    10,
    20,
    0,
    'Bootstrapped',
    false
  ),
  (
    'Squirro',
    'squirro',
    'Enterprise AI platform combining NLP and generative AI for intelligent search, insights, and knowledge automation.',
    'https://www.squirro.com',
    2012,
    'Zurich',
    'ZH',
    100,
    200,
    20000000,
    'Series B',
    false
  ),
  (
    'Veezoo',
    'veezoo',
    'Natural language query interface enabling business users to ask data questions in plain English and get instant answers.',
    'https://www.veezoo.com',
    2016,
    'Zurich',
    'ZH',
    20,
    50,
    6000000,
    'Series A',
    false
  ),
  (
    'Pricehubble',
    'pricehubble',
    'Real estate data and analytics platform using AI to provide accurate property valuations for banks and real estate professionals.',
    'https://www.pricehubble.com',
    2017,
    'Zurich',
    'ZH',
    200,
    500,
    75000000,
    'Series B',
    false
  ),
  (
    'Nexthink',
    'nexthink',
    'Digital employee experience management platform using AI analytics to proactively improve IT performance and productivity.',
    'https://www.nexthink.com',
    2004,
    'Lausanne',
    'VD',
    1000,
    2000,
    400000000,
    'Growth',
    false
  ),
  (
    'Meteomatics',
    'meteomatics',
    'Weather intelligence company providing AI-enhanced meteorological data and forecasting APIs for industries worldwide.',
    'https://www.meteomatics.com',
    2012,
    'St. Gallen',
    'SG',
    50,
    100,
    10000000,
    'Series A',
    false
  ),
  (
    'Numbrs',
    'numbrs',
    'Next-generation personal finance app using AI to consolidate banking accounts and provide intelligent financial insights.',
    'https://www.numbrs.com',
    2012,
    'Zurich',
    'ZH',
    200,
    500,
    200000000,
    'Growth',
    false
  ),
  (
    'Unique.ch',
    'unique-ch',
    'Generative AI platform for financial services, automating client advisory workflows and meeting documentation for banks.',
    'https://www.unique.ch',
    2021,
    'Zurich',
    'ZH',
    50,
    100,
    25000000,
    'Series A',
    false
  ),
  (
    'Loanboox',
    'loanboox',
    'AI-powered debt capital market platform connecting institutional borrowers with investors for municipal and corporate bonds.',
    'https://www.loanboox.com',
    2016,
    'Zurich',
    'ZH',
    20,
    50,
    8000000,
    'Series A',
    false
  ),
  (
    'Doodle',
    'doodle',
    'AI-enhanced scheduling platform helping millions of users find the best meeting times using smart availability analysis.',
    'https://www.doodle.com',
    2007,
    'Zurich',
    'ZH',
    100,
    200,
    30000000,
    'Series A',
    false
  ),
  (
    'Frontify',
    'frontify',
    'Cloud-based brand management platform using AI to help companies manage digital assets, brand guidelines, and design systems.',
    'https://www.frontify.com',
    2013,
    'St. Gallen',
    'SG',
    200,
    500,
    50000000,
    'Series C',
    false
  ),
  (
    'Batmaid',
    'batmaid',
    'On-demand home cleaning platform leveraging AI matching algorithms to connect households with vetted cleaning professionals.',
    'https://www.batmaid.ch',
    2015,
    'Lausanne',
    'VD',
    50,
    100,
    12000000,
    'Series A',
    false
  ),
  (
    'Anapaya',
    'anapaya',
    'Cybersecurity company building next-generation internet infrastructure using AI-driven routing for secure data transport.',
    'https://www.anapaya.net',
    2017,
    'Basel',
    'BS',
    20,
    50,
    5000000,
    'Seed',
    false
  ),
  (
    'Mindpeak',
    'mindpeak',
    'AI pathology company developing deep learning algorithms for automated analysis of cancer tissue in digital pathology.',
    'https://www.mindpeak.ai',
    2018,
    'Basel',
    'BS',
    20,
    50,
    10000000,
    'Series A',
    false
  ),
  (
    'GetYourGuide',
    'getyourguide',
    'Global travel experiences marketplace using ML and data analytics to connect travelers with tours, activities, and attractions.',
    'https://www.getyourguide.com',
    2009,
    'Zurich',
    'ZH',
    1000,
    2000,
    500000000,
    'Series F',
    false
  ),
  (
    'Arctan Group',
    'arctan-group',
    'Quantitative investment firm applying AI and machine learning models to systematic trading strategies in financial markets.',
    'https://www.arctangroup.com',
    2014,
    'Zurich',
    'ZH',
    10,
    20,
    0,
    'Bootstrapped',
    false
  ),
  (
    'Recommo',
    'recommo',
    'Generative AI startup building personalized recommendation engines and conversational commerce solutions for e-commerce.',
    'https://www.recommo.ai',
    2022,
    'Zurich',
    'ZH',
    5,
    10,
    1000000,
    'Pre-Seed',
    false
  ),
  (
    'Klartext AI',
    'klartext-ai',
    'NLP platform for automatic simplification of complex German legal and administrative texts into plain language.',
    'https://www.klartext-ai.ch',
    2020,
    'Zurich',
    'ZH',
    10,
    20,
    2000000,
    'Seed',
    false
  ),
  (
    'ELCA',
    'elca',
    'Swiss IT company providing AI-powered software engineering, digital transformation, and MLOps solutions for enterprises.',
    'https://www.elca.ch',
    1968,
    'Lausanne',
    'VD',
    500,
    1000,
    0,
    'Bootstrapped',
    false
  );

-- =============================================
-- DOMAIN MAPPINGS
-- =============================================

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'sophia-genetics' AND d.slug = 'healthtech-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'scandit' AND d.slug = 'computer-vision';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'neural-concept' AND d.slug = 'mlops';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, false
FROM companies c, ai_domains d
WHERE c.slug = 'neural-concept' AND d.slug = 'computer-vision';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'starmind' AND d.slug = 'nlp';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'yokoy' AND d.slug = 'fintech-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'contovista' AND d.slug = 'fintech-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'picterra' AND d.slug = 'computer-vision';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'teralytics' AND d.slug = 'data-analytics';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'axon-vibe' AND d.slug = 'data-analytics';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'seervision' AND d.slug = 'computer-vision';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'wingtra' AND d.slug = 'robotic-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'caplena' AND d.slug = 'nlp';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'squirro' AND d.slug = 'nlp';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, false
FROM companies c, ai_domains d
WHERE c.slug = 'squirro' AND d.slug = 'generative-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'veezoo' AND d.slug = 'nlp';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'pricehubble' AND d.slug = 'fintech-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'nexthink' AND d.slug = 'data-analytics';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'meteomatics' AND d.slug = 'data-analytics';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'numbrs' AND d.slug = 'fintech-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'unique-ch' AND d.slug = 'generative-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, false
FROM companies c, ai_domains d
WHERE c.slug = 'unique-ch' AND d.slug = 'fintech-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'loanboox' AND d.slug = 'fintech-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'doodle' AND d.slug = 'nlp';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'frontify' AND d.slug = 'other';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'batmaid' AND d.slug = 'other';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'anapaya' AND d.slug = 'cybersecurity-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'mindpeak' AND d.slug = 'healthtech-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'getyourguide' AND d.slug = 'data-analytics';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'arctan-group' AND d.slug = 'fintech-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'recommo' AND d.slug = 'generative-ai';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'klartext-ai' AND d.slug = 'nlp';

INSERT INTO company_domain_map (company_id, domain_id, is_primary)
SELECT c.id, d.id, true
FROM companies c, ai_domains d
WHERE c.slug = 'elca' AND d.slug = 'mlops';

-- =============================================
-- CATEGORY MAPPINGS
-- =============================================

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'sophia-genetics' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'scandit' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'neural-concept' AND cat.slug = 'deep-tech';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'starmind' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'yokoy' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'contovista' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'picterra' AND cat.slug = 'api';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'teralytics' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'axon-vibe' AND cat.slug = 'platform';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'seervision' AND cat.slug = 'deep-tech';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'wingtra' AND cat.slug = 'deep-tech';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'caplena' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'squirro' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'veezoo' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'pricehubble' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'nexthink' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'meteomatics' AND cat.slug = 'api';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'numbrs' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'unique-ch' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'loanboox' AND cat.slug = 'platform';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'doodle' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'frontify' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'batmaid' AND cat.slug = 'platform';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'anapaya' AND cat.slug = 'deep-tech';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'mindpeak' AND cat.slug = 'deep-tech';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'getyourguide' AND cat.slug = 'platform';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'arctan-group' AND cat.slug = 'other';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'recommo' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'klartext-ai' AND cat.slug = 'b2b-saas';

INSERT INTO company_category_map (company_id, category_id)
SELECT c.id, cat.id FROM companies c, company_categories cat
WHERE c.slug = 'elca' AND cat.slug = 'b2b-saas';

-- =============================================
-- TAG MAPPINGS
-- =============================================

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'sophia-genetics' AND t.slug IN ('machine-learning', 'healthcare', 'enterprise', 'swiss-made', 'b2b');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'scandit' AND t.slug IN ('computer-vision', 'enterprise', 'b2b', 'api-first', 'swiss-made');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'neural-concept' AND t.slug IN ('deep-learning', 'swiss-made', 'b2b', 'startup');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'starmind' AND t.slug IN ('nlp', 'enterprise', 'b2b', 'swiss-made');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'yokoy' AND t.slug IN ('finance', 'enterprise', 'automation', 'b2b', 'swiss-made');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'nexthink' AND t.slug IN ('analytics', 'enterprise', 'b2b', 'scaleup', 'swiss-made');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'wingtra' AND t.slug IN ('robotics', 'deep-learning', 'swiss-made', 'b2b');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'getyourguide' AND t.slug IN ('machine-learning', 'analytics', 'data-platform', 'scaleup', 'b2c');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'unique-ch' AND t.slug IN ('generative', 'finance', 'enterprise', 'swiss-made', 'startup');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'squirro' AND t.slug IN ('nlp', 'generative', 'enterprise', 'b2b', 'swiss-made');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'anapaya' AND t.slug IN ('security', 'deep-learning', 'swiss-made', 'b2b');

INSERT INTO company_tag_map (company_id, tag_id)
SELECT c.id, t.id FROM companies c, company_tags t
WHERE c.slug = 'mindpeak' AND t.slug IN ('deep-learning', 'healthcare', 'swiss-made', 'startup');

-- =============================================
-- FUNDING ROUNDS
-- =============================================

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series E', 100000000, '2021-07-20', 'OrbiMed Advisors'
FROM companies c WHERE c.slug = 'sophia-genetics';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series D', 100000000, '2020-07-15', 'SoftBank Vision Fund'
FROM companies c WHERE c.slug = 'sophia-genetics';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series D', 150000000, '2022-09-14', 'Warburg Pincus'
FROM companies c WHERE c.slug = 'scandit';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series C', 50000000, '2020-06-30', 'Warburg Pincus'
FROM companies c WHERE c.slug = 'scandit';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series B', 30000000, '2023-03-15', 'Balderton Capital'
FROM companies c WHERE c.slug = 'neural-concept';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series B', 80000000, '2022-05-10', 'Index Ventures'
FROM companies c WHERE c.slug = 'yokoy';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series A', 30000000, '2021-03-01', 'Forestay Capital'
FROM companies c WHERE c.slug = 'yokoy';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series B', 75000000, '2022-11-08', 'Frontier Growth'
FROM companies c WHERE c.slug = 'pricehubble';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Growth', 400000000, '2021-12-01', 'Permira'
FROM companies c WHERE c.slug = 'nexthink';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series F', 500000000, '2022-04-06', 'SoftBank Vision Fund'
FROM companies c WHERE c.slug = 'getyourguide';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series A', 25000000, '2023-06-01', 'HV Capital'
FROM companies c WHERE c.slug = 'unique-ch';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series B', 22000000, '2022-10-12', 'Forestay Capital'
FROM companies c WHERE c.slug = 'wingtra';

INSERT INTO funding_rounds (company_id, round_type, amount_chf, announced_date, lead_investor)
SELECT c.id, 'Series A', 10000000, '2022-01-15', 'Earlybird Venture Capital'
FROM companies c WHERE c.slug = 'mindpeak';
