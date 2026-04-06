-- NOGA 2008 Seed Data - Part 2: Sections K-U

-- ============================================================
-- SECTION LEVEL (level=1) - Sections K-U
-- ============================================================
INSERT INTO noga_codes (code, label_de, label_fr, section, section_label_de, division, group_code, class_code, level) VALUES
('K','Erbringung von Finanz- und Versicherungsdienstleistungen','Activités financières et d''assurance','K','Erbringung von Finanz- und Versicherungsdienstleistungen',NULL,NULL,NULL,1),
('L','Grundstücks- und Wohnungswesen','Activités immobilières','L','Grundstücks- und Wohnungswesen',NULL,NULL,NULL,1),
('M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','Activités spécialisées, scientifiques et techniques','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen',NULL,NULL,NULL,1),
('N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','Activités de services administratifs et de soutien','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen',NULL,NULL,NULL,1),
('O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','Administration publique et défense/ sécurité sociale obligatoire','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung',NULL,NULL,NULL,1),
('P','Erziehung und Unterricht','Enseignement','P','Erziehung und Unterricht',NULL,NULL,NULL,1),
('Q','Gesundheits- und Sozialwesen','Santé humaine et action sociale','Q','Gesundheits- und Sozialwesen',NULL,NULL,NULL,1),
('R','Kunst, Unterhaltung und Erholung','Arts, spectacles et activités récréatives','R','Kunst, Unterhaltung und Erholung',NULL,NULL,NULL,1),
('S','Erbringung von sonstigen Dienstleistungen','Autres activités de services','S','Erbringung von sonstigen Dienstleistungen',NULL,NULL,NULL,1),
('T','Private Haushalte mit Hauspersonal/ Herstellung von Waren und Erbringung von Dienstleistungen durch private Haushalte','Activités des ménages en tant qu''employeurs','T','Private Haushalte mit Hauspersonal',NULL,NULL,NULL,1),
('U','Exterritoriale Organisationen und Körperschaften','Activités des organisations et organismes extraterritoriaux','U','Exterritoriale Organisationen und Körperschaften',NULL,NULL,NULL,1)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION K: Finanz- und Versicherungsdienstleistungen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('64','Erbringung von Finanzdienstleistungen','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64',NULL,NULL,2),
('65','Versicherungen, Rückversicherungen und Pensionskassen','K','Erbringung von Finanz- und Versicherungsdienstleistungen','65',NULL,NULL,2),
('66','Mit Finanz- und Versicherungsdienstleistungen verbundene Tätigkeiten','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66',NULL,NULL,2)
ON CONFLICT (code) DO NOTHING;

INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('64.11','Zentralbankwesen','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.1','64.11',4),
('64.19','Sonstige Währungsintermediation','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.1','64.19',4),
('64.20','Beteiligungsgesellschaften','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.2','64.20',4),
('64.30','Treuhandgesellschaften und Kapitalanlagegesellschaften','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.3','64.30',4),
('64.91','Kreditgewährung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.9','64.91',4),
('64.92','Sonstige Kreditgewährung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.9','64.92',4),
('64.99','Sonstige Finanzdienstleistungen a.n.g.','K','Erbringung von Finanz- und Versicherungsdienstleistungen','64','64.9','64.99',4),
('65.11','Lebensversicherung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','65','65.1','65.11',4),
('65.12','Schaden- und Unfallversicherung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','65','65.1','65.12',4),
('65.20','Rückversicherung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','65','65.2','65.20',4),
('65.30','Pensionskassen','K','Erbringung von Finanz- und Versicherungsdienstleistungen','65','65.3','65.30',4),
('66.11','Verwaltung und Betrieb von Wertpapierbörsen','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.1','66.11',4),
('66.12','Wertpapier- und Warenmakler','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.1','66.12',4),
('66.19','Sonstige mit Finanzdienstleistungen verbundene Tätigkeiten','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.1','66.19',4),
('66.21','Risiko- und Schadensbewertung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.2','66.21',4),
('66.22','Tätigkeit von Versicherungsvertretern','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.2','66.22',4),
('66.29','Sonstige mit Versicherungsdienstleistungen verbundene Tätigkeiten','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.2','66.29',4),
('66.30','Fondsverwaltung','K','Erbringung von Finanz- und Versicherungsdienstleistungen','66','66.3','66.30',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION L: Grundstücks- und Wohnungswesen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('68','Grundstücks- und Wohnungswesen','L','Grundstücks- und Wohnungswesen','68',NULL,NULL,2),
('68.10','Kauf und Verkauf von eigenen Grundstücken, Gebäuden und Wohnungen','L','Grundstücks- und Wohnungswesen','68','68.1','68.10',4),
('68.20','Vermietung und Verpachtung von eigenen oder geleasten Grundstücken, Gebäuden und Wohnungen','L','Grundstücks- und Wohnungswesen','68','68.2','68.20',4),
('68.31','Vermittlung von Grundstücken, Gebäuden und Wohnungen','L','Grundstücks- und Wohnungswesen','68','68.3','68.31',4),
('68.32','Verwaltung von Grundstücken, Gebäuden und Wohnungen','L','Grundstücks- und Wohnungswesen','68','68.3','68.32',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION M: Freiberufliche, wissenschaftliche und technische Dienstleistungen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('69','Rechts- und Steuerberatung, Wirtschaftsprüfung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','69',NULL,NULL,2),
('70','Verwaltung und Führung von Unternehmen und Betrieben/ Unternehmensberatung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','70',NULL,NULL,2),
('71','Architektur- und Ingenieurbüros/ technische, physikalische und chemische Untersuchung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','71',NULL,NULL,2),
('72','Forschung und Entwicklung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','72',NULL,NULL,2),
('73','Werbung und Marktforschung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','73',NULL,NULL,2),
('74','Sonstige freiberufliche, wissenschaftliche und technische Tätigkeiten','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','74',NULL,NULL,2),
('75','Veterinärwesen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','75',NULL,NULL,2)
ON CONFLICT (code) DO NOTHING;

INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('69.10','Rechtsberatung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','69','69.1','69.10',4),
('69.20','Wirtschaftsprüfung und Steuerberatung/ Buchführung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','69','69.2','69.20',4),
('70.10','Verwaltung und Führung von Unternehmen und Betrieben','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','70','70.1','70.10',4),
('70.21','Public-Relations-Beratung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','70','70.2','70.21',4),
('70.22','Unternehmensberatung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','70','70.2','70.22',4),
('71.11','Architektur- und Stadtplanungsbüros','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','71','71.1','71.11',4),
('71.12','Ingenieurbüros und technische Fachplanungen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','71','71.1','71.12',4),
('71.20','Technische, physikalische und chemische Untersuchung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','71','71.2','71.20',4),
('72.11','Forschung und Entwicklung im Bereich Biotechnologie','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','72','72.1','72.11',4),
('72.19','Sonstige Forschung und Entwicklung im Bereich Natur-, Ingenieur- und Agrarwissenschaften','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','72','72.1','72.19',4),
('72.20','Forschung und Entwicklung im Bereich Rechts-, Wirtschafts- und Sozialwissenschaften','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','72','72.2','72.20',4),
('73.11','Werbeagenturen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','73','73.1','73.11',4),
('73.12','Vermarktung und Verkauf von Werbezeiten und -flächen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','73','73.1','73.12',4),
('73.20','Markt- und Meinungsforschung','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','73','73.2','73.20',4),
('74.10','Industrielles Design und sonstiges Designwesen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','74','74.1','74.10',4),
('74.20','Fotografie und fotografische Tätigkeiten','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','74','74.2','74.20',4),
('74.30','Übersetzen und Dolmetschen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','74','74.3','74.30',4),
('74.90','Sonstige freiberufliche, wissenschaftliche und technische Tätigkeiten a.n.g.','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','74','74.9','74.90',4),
('75.00','Veterinärwesen','M','Erbringung von freiberuflichen, wissenschaftlichen und technischen Dienstleistungen','75','75.0','75.00',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION N: Sonstige wirtschaftliche Dienstleistungen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('77','Vermietung von beweglichen Sachen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77',NULL,NULL,2),
('78','Vermittlung und Überlassung von Arbeitskräften','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','78',NULL,NULL,2),
('79','Reisebüros, Reiseveranstalter und Erbringung sonstiger Reservierungsdienstleistungen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','79',NULL,NULL,2),
('80','Wach- und Sicherheitsdienste sowie Detekteien','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','80',NULL,NULL,2),
('81','Gebäudebetreuung/ Garten- und Landschaftsbau','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81',NULL,NULL,2),
('82','Erbringung von wirtschaftlichen Dienstleistungen für Unternehmen und Privatpersonen a.n.g.','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82',NULL,NULL,2)
ON CONFLICT (code) DO NOTHING;

INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('77.11','Vermietung von Personenkraftwagen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.1','77.11',4),
('77.12','Vermietung von Lkw','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.1','77.12',4),
('77.21','Vermietung von Sport- und Freizeitgeräten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.2','77.21',4),
('77.22','Vermietung von Videokassetten und DVDs','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.2','77.22',4),
('77.29','Vermietung von sonstigen Gebrauchsgütern','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.2','77.29',4),
('77.31','Vermietung von landwirtschaftlichen Maschinen und Geräten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.31',4),
('77.32','Vermietung von Maschinen und Geräten für das Baugewerbe','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.32',4),
('77.33','Vermietung von Büromaschinen und -einrichtungen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.33',4),
('77.34','Vermietung von Wasserfahrzeugen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.34',4),
('77.35','Vermietung von Luftfahrzeugen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.35',4),
('77.39','Vermietung von sonstigen Maschinen, Geräten und Sachen a.n.g.','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.3','77.39',4),
('77.40','Leasing von nicht finanziellen immateriellen Vermögenswerten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','77','77.4','77.40',4),
('78.10','Vermittlung von Arbeitskräften','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','78','78.1','78.10',4),
('78.20','Befristete Überlassung von Arbeitskräften','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','78','78.2','78.20',4),
('78.30','Sonstige Überlassung von Arbeitskräften','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','78','78.3','78.30',4),
('79.11','Reisebüros','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','79','79.1','79.11',4),
('79.12','Reiseveranstalter','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','79','79.1','79.12',4),
('79.90','Erbringung sonstiger Reservierungsdienstleistungen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','79','79.9','79.90',4),
('80.10','Private Sicherheitsdienste','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','80','80.1','80.10',4),
('80.20','Sicherheitsdienste mit Überwachung','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','80','80.2','80.20',4),
('80.30','Detekteien','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','80','80.3','80.30',4),
('81.10','Hausmeisterservice und Gebäudebetreuung','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81','81.1','81.10',4),
('81.21','Allgemeine Gebäudereinigung','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81','81.2','81.21',4),
('81.22','Spezialisierte Reinigungsarbeiten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81','81.2','81.22',4),
('81.29','Sonstige Reinigungstätigkeiten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81','81.2','81.29',4),
('81.30','Garten- und Landschaftsbau','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','81','81.3','81.30',4),
('82.11','Allgemeine Sekretariatsdienste','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.1','82.11',4),
('82.19','Erbringung von sonstigen Büro- und Schreibdiensten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.1','82.19',4),
('82.20','Call-Center-Aktivitäten','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.2','82.20',4),
('82.30','Organisation von Messen, Ausstellungen und Kongressen','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.3','82.30',4),
('82.91','Inkasso- und Creditbüros','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.9','82.91',4),
('82.92','Verpackungsgewerbe','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.9','82.92',4),
('82.99','Erbringung von sonstigen wirtschaftlichen Dienstleistungen a.n.g.','N','Erbringung von sonstigen wirtschaftlichen Dienstleistungen','82','82.9','82.99',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION O: Öffentliche Verwaltung, Verteidigung/ Sozialversicherung
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('84','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84',NULL,NULL,2),
('84.11','Allgemeine öffentliche Verwaltung','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.1','84.11',4),
('84.12','Öffentliche Verwaltung auf den Gebieten Gesundheit, Bildung, Kultur und soziale Einrichtungen','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.1','84.12',4),
('84.13','Wirtschaftliche Angelegenheiten und Verwaltung der Bereiche Wirtschaft und Energie','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.1','84.13',4),
('84.21','Auswärtige Angelegenheiten','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.2','84.21',4),
('84.22','Verteidigung','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.2','84.22',4),
('84.23','Öffentliche Ordnung und Sicherheit','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.2','84.23',4),
('84.24','Gerichtsbarkeit und Rechtspflege','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.2','84.24',4),
('84.25','Feuerschutz und Katastrophenschutz','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.2','84.25',4),
('84.30','Sozialversicherung','O','Öffentliche Verwaltung, Verteidigung/ Sozialversicherung','84','84.3','84.30',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION P: Erziehung und Unterricht
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('85','Erziehung und Unterricht','P','Erziehung und Unterricht','85',NULL,NULL,2),
('85.10','Kindergärten und Vorschulen','P','Erziehung und Unterricht','85','85.1','85.10',4),
('85.20','Grundschulen','P','Erziehung und Unterricht','85','85.2','85.20',4),
('85.31','Weiterführende Schulen des allgemeinbildenden Unterrichts','P','Erziehung und Unterricht','85','85.3','85.31',4),
('85.32','Weiterführende Schulen des beruflichen Unterrichts','P','Erziehung und Unterricht','85','85.3','85.32',4),
('85.41','Berufsschulen und berufliche Gymnasien','P','Erziehung und Unterricht','85','85.4','85.41',4),
('85.42','Hochschulen','P','Erziehung und Unterricht','85','85.4','85.42',4),
('85.51','Sportunterricht und Freizeitunterricht','P','Erziehung und Unterricht','85','85.5','85.51',4),
('85.52','Kulturunterricht','P','Erziehung und Unterricht','85','85.5','85.52',4),
('85.53','Fahrunterricht','P','Erziehung und Unterricht','85','85.5','85.53',4),
('85.59','Sonstiger Unterricht a.n.g.','P','Erziehung und Unterricht','85','85.5','85.59',4),
('85.60','Erbringung von Dienstleistungen für den Unterricht','P','Erziehung und Unterricht','85','85.6','85.60',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION Q: Gesundheits- und Sozialwesen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('86','Gesundheitswesen','Q','Gesundheits- und Sozialwesen','86',NULL,NULL,2),
('87','Heime (ohne Erholungs- und Ferienheime)','Q','Gesundheits- und Sozialwesen','87',NULL,NULL,2),
('88','Sozialwesen (ohne Heime)','Q','Gesundheits- und Sozialwesen','88',NULL,NULL,2),
('86.10','Krankenhäuser','Q','Gesundheits- und Sozialwesen','86','86.1','86.10',4),
('86.21','Praxen von Allgemeinmedizinern','Q','Gesundheits- und Sozialwesen','86','86.2','86.21',4),
('86.22','Praxen von Fachärzten','Q','Gesundheits- und Sozialwesen','86','86.2','86.22',4),
('86.23','Zahnarztpraxen','Q','Gesundheits- und Sozialwesen','86','86.2','86.23',4),
('86.90','Sonstige Aktivitäten des Gesundheitswesens','Q','Gesundheits- und Sozialwesen','86','86.9','86.90',4),
('87.10','Stationäre Pflegeeinrichtungen','Q','Gesundheits- und Sozialwesen','87','87.1','87.10',4),
('87.20','Einrichtungen zur sozialen Betreuung mit Unterbringung von psychisch Kranken und Suchtkranken','Q','Gesundheits- und Sozialwesen','87','87.2','87.20',4),
('87.30','Einrichtungen zur sozialen Betreuung mit Unterbringung von älteren Menschen und Behinderten','Q','Gesundheits- und Sozialwesen','87','87.3','87.30',4),
('87.90','Sonstige Heime (ohne Erholungs- und Ferienheime)','Q','Gesundheits- und Sozialwesen','87','87.9','87.90',4),
('88.10','Sozialwesen ohne Unterbringung für ältere Menschen und Behinderte','Q','Gesundheits- und Sozialwesen','88','88.1','88.10',4),
('88.91','Tagesbetreuung von Kindern','Q','Gesundheits- und Sozialwesen','88','88.9','88.91',4),
('88.99','Sonstiges Sozialwesen ohne Unterbringung a.n.g.','Q','Gesundheits- und Sozialwesen','88','88.9','88.99',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION R: Kunst, Unterhaltung und Erholung
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('90','Kreative, künstlerische und unterhaltende Tätigkeiten','R','Kunst, Unterhaltung und Erholung','90',NULL,NULL,2),
('91','Bibliotheken, Archive, Museen, botanische und zoologische Gärten','R','Kunst, Unterhaltung und Erholung','91',NULL,NULL,2),
('92','Spiel-, Wett- und Lotteriewesen','R','Kunst, Unterhaltung und Erholung','92',NULL,NULL,2),
('93','Erbringung von Dienstleistungen des Sports, der Unterhaltung und der Erholung','R','Kunst, Unterhaltung und Erholung','93',NULL,NULL,2),
('90.01','Aufführung von darstellenden Künsten','R','Kunst, Unterhaltung und Erholung','90','90.0','90.01',4),
('90.02','Erbringung von Dienstleistungen für die darstellenden Künste','R','Kunst, Unterhaltung und Erholung','90','90.0','90.02',4),
('90.03','Künstlerische und schriftstellerische Tätigkeiten und Darbietungen','R','Kunst, Unterhaltung und Erholung','90','90.0','90.03',4),
('90.04','Betrieb von Theatergebäuden und Konzerthallen','R','Kunst, Unterhaltung und Erholung','90','90.0','90.04',4),
('91.01','Bibliotheken und Archive','R','Kunst, Unterhaltung und Erholung','91','91.0','91.01',4),
('91.02','Betrieb von Museen','R','Kunst, Unterhaltung und Erholung','91','91.0','91.02',4),
('91.03','Betrieb von historischen Stätten und Gebäuden und ähnliche Attraktionen','R','Kunst, Unterhaltung und Erholung','91','91.0','91.03',4),
('91.04','Betrieb von botanischen und zoologischen Gärten sowie Naturparken','R','Kunst, Unterhaltung und Erholung','91','91.0','91.04',4),
('92.00','Spiel-, Wett- und Lotteriewesen','R','Kunst, Unterhaltung und Erholung','92','92.0','92.00',4),
('93.11','Betrieb von Sportanlagen','R','Kunst, Unterhaltung und Erholung','93','93.1','93.11',4),
('93.12','Aktivitäten von Sportvereinen','R','Kunst, Unterhaltung und Erholung','93','93.1','93.12',4),
('93.13','Fitnesszentren','R','Kunst, Unterhaltung und Erholung','93','93.1','93.13',4),
('93.19','Sonstige sportliche Aktivitäten','R','Kunst, Unterhaltung und Erholung','93','93.1','93.19',4),
('93.21','Vergnügungs- und Erholungsparks','R','Kunst, Unterhaltung und Erholung','93','93.2','93.21',4),
('93.29','Sonstige Unterhaltungs- und Erholungsaktivitäten','R','Kunst, Unterhaltung und Erholung','93','93.2','93.29',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION S: Erbringung von sonstigen Dienstleistungen
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('94','Interessenvertretungen sowie kirchliche und sonstige religiöse Vereinigungen','S','Erbringung von sonstigen Dienstleistungen','94',NULL,NULL,2),
('95','Reparatur von Datenverarbeitungsgeräten und Gebrauchsgütern','S','Erbringung von sonstigen Dienstleistungen','95',NULL,NULL,2),
('96','Erbringung von sonstigen überwiegend persönlichen Dienstleistungen','S','Erbringung von sonstigen Dienstleistungen','96',NULL,NULL,2),
('94.11','Wirtschaftsverbände und Arbeitgeberverbände','S','Erbringung von sonstigen Dienstleistungen','94','94.1','94.11',4),
('94.12','Berufsverbände','S','Erbringung von sonstigen Dienstleistungen','94','94.1','94.12',4),
('94.20','Gewerkschaften','S','Erbringung von sonstigen Dienstleistungen','94','94.2','94.20',4),
('94.91','Kirchliche und religiöse Vereinigungen','S','Erbringung von sonstigen Dienstleistungen','94','94.9','94.91',4),
('94.92','Politische Parteien','S','Erbringung von sonstigen Dienstleistungen','94','94.9','94.92',4),
('94.99','Sonstige Interessenvertretungen und Vereinigungen a.n.g.','S','Erbringung von sonstigen Dienstleistungen','94','94.9','94.99',4),
('95.11','Reparatur von Datenverarbeitungsgeräten und peripheren Geräten','S','Erbringung von sonstigen Dienstleistungen','95','95.1','95.11',4),
('95.12','Reparatur von Kommunikationsgeräten','S','Erbringung von sonstigen Dienstleistungen','95','95.1','95.12',4),
('95.21','Reparatur von Unterhaltungselektronik','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.21',4),
('95.22','Reparatur von Haushaltsgeräten sowie Haus- und Gartengeräten','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.22',4),
('95.23','Reparatur von Schuhen und Lederwaren','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.23',4),
('95.24','Reparatur von Möbeln und Einrichtungsgegenständen','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.24',4),
('95.25','Reparatur von Uhren und Schmuck','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.25',4),
('95.29','Reparatur von sonstigen Gebrauchsgütern','S','Erbringung von sonstigen Dienstleistungen','95','95.2','95.29',4),
('96.01','Wäscherei und chemische Reinigung','S','Erbringung von sonstigen Dienstleistungen','96','96.0','96.01',4),
('96.02','Frisör- und Kosmetikgewerbe','S','Erbringung von sonstigen Dienstleistungen','96','96.0','96.02',4),
('96.03','Sarg- und Bestattungsgewerbe','S','Erbringung von sonstigen Dienstleistungen','96','96.0','96.03',4),
('96.04','Saunas, Solarien, Bäder und ähnliche Einrichtungen','S','Erbringung von sonstigen Dienstleistungen','96','96.0','96.04',4),
('96.09','Erbringung von sonstigen persönlichen Dienstleistungen a.n.g.','S','Erbringung von sonstigen Dienstleistungen','96','96.0','96.09',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION T: Private Haushalte mit Hauspersonal
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('97','Häusliche Dienste von Privatpersonen','T','Private Haushalte mit Hauspersonal',NULL,NULL,NULL,2),
('98','Herstellung von Waren und Erbringung von Dienstleistungen durch private Haushalte für den Eigenbedarf','T','Private Haushalte mit Hauspersonal',NULL,NULL,NULL,2),
('97.00','Häusliche Dienste von Privatpersonen','T','Private Haushalte mit Hauspersonal','97','97.0','97.00',4),
('98.10','Herstellung von Waren durch private Haushalte für den Eigenbedarf ohne ausgeprägten Schwerpunkt','T','Private Haushalte mit Hauspersonal','98','98.1','98.10',4),
('98.20','Erbringung von Dienstleistungen durch private Haushalte für den Eigenbedarf ohne ausgeprägten Schwerpunkt','T','Private Haushalte mit Hauspersonal','98','98.2','98.20',4)
ON CONFLICT (code) DO NOTHING;

-- ============================================================
-- SECTION U: Exterritoriale Organisationen und Körperschaften
-- ============================================================
INSERT INTO noga_codes (code, label_de, section, section_label_de, division, group_code, class_code, level) VALUES
('99','Exterritoriale Organisationen und Körperschaften','U','Exterritoriale Organisationen und Körperschaften',NULL,NULL,NULL,2),
('99.00','Exterritoriale Organisationen und Körperschaften','U','Exterritoriale Organisationen und Körperschaften','99','99.0','99.00',4)
ON CONFLICT (code) DO NOTHING;
